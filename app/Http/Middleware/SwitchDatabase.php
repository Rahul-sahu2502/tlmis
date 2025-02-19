<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use Symfony\Component\HttpFoundation\Response;

class SwitchDatabase
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $username = $request->username;
        if ( !empty(Session::get('username')) && Session::get('username')){
            $username = Session::get('username');
        }
        //dd(Session::all());
        // Fetch the user-specific database details
        $data = DB::connection('tlmis_central_maindb')
            ->table('tbl_user_details')
            ->where('username', $username)
            ->first();
        if ($data) {
            // Update the database connection dynamically
            Config::set('database.connections.tenant', [
                'driver' => 'mysql',
                'host' => $data->db_host ?? env('DB_HOST', '127.0.0.1'),
                'port' => $data->db_port ?? env('DB_PORT', '3306'),
                'database' => $data->db_database,
                'username' => $data->db_username,
                'password' => $data->db_password,
                'charset' => 'utf8mb4',
                'collation' => 'utf8mb4_unicode_ci',
                'prefix' => '',
                'strict' => false,
                'engine' => null,
            ]);

            DB::purge('tenant'); // Clear any existing connections
            DB::setDefaultConnection('tenant'); // Set as the default connection
            Log::info('Tenant Database Connection:', [
                'host' => Config::get('database.connections.tenant.host'),
                'database' => Config::get('database.connections.tenant.database'),
                'username' => Config::get('database.connections.tenant.username'),
            ]);

        }

        return $next($request);
    }

    /**
     * Update the .env file with new key-value pairs.
     *
     * @param array $data Key-value pairs to update in the .env file
     */
    protected function updateEnvironmentFile(array $data)
    {
        $envPath = base_path('.env');
        if (File::exists($envPath)) {
            $envContent = File::get($envPath);
            foreach ($data as $key => $value) {
                $pattern = "/^{$key}=.*$/m";
                $replacement = "{$key}={$value}";
                if (preg_match($pattern, $envContent)) {
                    $envContent = preg_replace($pattern, $replacement, $envContent);
                } else {
                    $envContent .= "\n{$key}={$value}";
                }
            }
            File::put($envPath, $envContent);
        }
    }
}
