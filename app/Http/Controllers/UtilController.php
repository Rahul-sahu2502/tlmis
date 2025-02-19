<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Laravel\Facades\Image;
use setasign\Fpdi\Fpdi;

class UtilController extends Controller
{
    /* Captcha Related Functions */

    function generateCaptcha($length)
    {
        $image = imagecreatetruecolor(200, 50);
        $bgColor = imagecolorallocate($image, 255, 255, 255);
        imagefilledrectangle($image, 0, 0, 200, 50, $bgColor);
        $textColor = imagecolorallocate($image, 0, 0, 0);
        $captchaText = substr(str_shuffle('ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 0, $length);
        session(['captcha' => $captchaText]);
        $fontPath = public_path('assets/fonts/arial.ttf');
        if (!file_exists($fontPath)) {
            return response()->json(['error' => 'Font file not found!'], 500);
        }
        imagettftext($image, 20, 0, 30, 30, $textColor, $fontPath, $captchaText);
        ob_start();
        imagepng($image);
        $imageData = ob_get_contents();
        ob_end_clean();
        imagedestroy($image);
        return response($imageData)->header('Content-Type', 'image/png');
    }

    /* Password and Hashing Related Functions */
    function create_password($password): array
    {
        $staticKey = Config::get("salt.STATIC_SALT");
        $password_sandwich = $staticKey . $password . $staticKey;
        $first_hashed_password = hash('SHA512', $password_sandwich);

        $salt = $this->getToken(7);
        $salt_password = $first_hashed_password . $salt;
        $final_hashed_password = hash('SHA512', $salt_password);
        return (['salt' => $salt, 'hashed_password' => $final_hashed_password]);
    }

    function crypto_rand_secure($min, $max)
    {
        $range = $max - $min;
        if ($range < 1) return $min; // not so random...
        $log = ceil(log($range, 2));
        $bytes = (int)($log / 8) + 1; // length in bytes
        $bits = (int)$log + 1; // length in bits
        $filter = (int)(1 << $bits) - 1; // set all lower bits to 1
        do {
            $rnd = hexdec(bin2hex(openssl_random_pseudo_bytes($bytes)));
            $rnd = $rnd & $filter; // discard irrelevant bits
        } while ($rnd > $range);
        return $min + $rnd;
    }

    function getToken($length)
    {
        $token = "";
        $codeAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        $codeAlphabet .= "abcdefghijklmnopqrstuvwxyz";
        $codeAlphabet .= "0123456789";
        $max = strlen($codeAlphabet); // edited

        for ($i = 0; $i < $length; $i++) {
            $token .= $codeAlphabet[$this->crypto_rand_secure(0, $max - 1)];
        }

        return $token;
    }

    function change_password($password): array
    {
        $salt = $this->getToken(7);
        $salt_password = $password . $salt;
        $final_hashed_password = hash('SHA512', $salt_password);
        return (['salt' => $salt, 'hashed_password' => $final_hashed_password]);
    }

    /* File Uplaod Related Function */
    static function upload_file($file, $upload_path, $disk, $allowed_extensions, $allowed_types)
    {
        $file_extension = pathinfo($file->getClientOriginalName(), PATHINFO_EXTENSION);
        $file_mime_type = $file->getClientMimeType();
        $filename = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
        $filename = preg_replace('/\s+/', '_', trim($filename)) . '_' . time() . '.' . $file_extension;

        // Check if file extension is allowed
        if (!in_array($file_extension, $allowed_extensions)) {
            throw new \Exception('File should contain following extensions: ' . implode(', ', $allowed_extensions));
        }
        // Check if file mime type is allowed
        else if (!in_array($file_mime_type, $allowed_types)) {
            throw new \Exception('File should contain following mime types: ' . implode(', ', $allowed_types));
        }
        else {
            // $image_name = preg_replace('/\s+/', '_', trim($filename)) . '_' . time() . '.' . $file_extension;

            if (in_array($file_extension, ['jpeg', 'jpg', 'png'])) {
                // Compress image files (JPEG/PNG)
                $temp_image_path = sys_get_temp_dir() . '/' . $filename;

                if ($file_extension === 'jpg' || $file_extension === 'jpeg') {
                    $image = imagecreatefromjpeg($file->getRealPath());
                } elseif ($file_extension === 'png') {
                    $image = imagecreatefrompng($file->getRealPath());
                }

                // Get the current width and height of the image
                list($original_width, $original_height) = getimagesize($file->getRealPath());

                // Set the new width
                $new_width = 800;

                // Calculate the new height to maintain aspect ratio
                $new_height = ($new_width / $original_width) * $original_height;

                // Create a new true color image with the new dimensions
                $new_image = imagecreatetruecolor($new_width, $new_height);

                // Preserve transparency for PNG
                if ($file_extension === 'png') {
                    imagealphablending($new_image, false);
                    imagesavealpha($new_image, true);
                }

                // Resample the image to the new dimensions
                imagecopyresampled($new_image, $image, 0, 0, 0, 0, $new_width, $new_height, $original_width, $original_height);

                // Save the resized image to a temporary file
                if ($file_extension === 'jpg' || $file_extension === 'jpeg') {
                    imagejpeg($new_image, $temp_image_path, 90); // Adjust quality as needed
                } elseif ($file_extension === 'png') {
                    imagepng($new_image, $temp_image_path, 8); // Compression level (0-9)
                }

                // Free up memory
                imagedestroy($image);
                imagedestroy($new_image);

                // Use the compressed file for upload
                // $file_content = file_get_contents($temp_image_path);
                unlink($temp_image_path); // Remove temporary file
            }
            elseif ($file_extension === 'pdf') {
                // Handle PDF compression (if applicable)
                $tmp_file = $file->getRealPath();
                $compressedFile = self::compressPdf($tmp_file);

                // Clean up the temporary file (after processing)
                unlink($compressedFile);
            }

            if (config('app.env') === 'production') {
                $filePath = config('custom.s3_bucket_folder').'/'.$upload_path.'/'.$filename;
                $upload_sts=Storage::disk('s3')->put($filePath, file_get_contents($file), 'public');
                if($upload_sts)
                    return $filePath;
                else
                    return false;
            }
            else{
                 // Save the file using storeAs at the end
                return $file->storeAs($upload_path, $filename, $disk);
            }
        }
    }

    private static  function compressPdf($file_path) {
        // Create FPDI instance
        $pdf = new Fpdi();

        // Set source file
        $pdf->setSourceFile($file_path);

        // Create a temporary file for the compressed PDF
        $tmpFile = tempnam(sys_get_temp_dir(), 'compressed_pdf_');
        $pdf->AddPage();

        // Loop through each page in the original PDF
        $pageCount = $pdf->setSourceFile($file_path);
        for ($i = 1; $i <= $pageCount; $i++) {
            // Import each page from the original PDF
            $template = $pdf->importPage($i);
            $pdf->useTemplate($template);
        }

        // Output the compressed PDF to the temporary file
        $pdf->Output('F', $tmpFile);

        // Return the path to the temporary file for further processing (e.g., storing)
        return $tmpFile;
    }


    public function test_s3()
    {
        try {
            $assetUrl = public_path('assets/images/logo-dark.png'); // Asset URL
            if (file_exists($assetUrl)) {
                echo "File exists!";
            } else {
                echo "File not found!";
            }
            // Uploading to DigitalOcean Spaces (S3)
            $result = Storage::disk('s3')->putFileAs('test', $assetUrl, 'logo-dark.png', 'public');
            dd($result);
        } catch (\Exception $e) {
            dd($e->getMessage());
        }
    }
}
