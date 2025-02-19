let script1 = document.createElement("script");
script1.type = "text/javascript";
script1.src = '/assets/js/custom/krutiuni.js'
document.head.appendChild(script1);

let script2 = document.createElement("script");
script2.type = "text/javascript";
script2.src = '/assets/js/custom/unikruti.js'
document.head.appendChild(script2);

function processHtmlUnicodeToKrutiDev(htmlContent) {
    // Create a temporary container to parse the HTML
    const tempDiv = document.createElement('div');
    tempDiv.innerHTML = htmlContent;

    const paragraphs = tempDiv.querySelectorAll('p');
    let extractedValues = [];

    // Extract the values from the paragraphs (ignoring content inside [[ ]])
    paragraphs.forEach(paragraph => {
        // Get the raw text content, skipping content inside [[ ]]
        let paragraphHtml = paragraph.innerHTML;

        // Extract the text and remove content inside [[ ]] using regex
        let extractedText = paragraphHtml.replace(/\[\[(.*?)\]\]/g, '').replace(/<[^>]+>/g, '').trim();

        // Store the extracted value
        extractedValues.push(extractedText);

        // Store the content inside [[ ]] separately (for the last paragraph)
        if (paragraphHtml.includes('[[')) {
            let insideBrackets = paragraphHtml.match(/\[\[(.*?)\]\]/g);
            extractedValues.push(insideBrackets ? insideBrackets[0].replace(/[\[\]]/g, '').trim() : '');
        }
    });

    // Now, rebuild the HTML with the original structure but with modified text
    paragraphs.forEach((paragraph, index) => {
        // Rebuild the paragraph's HTML with the processed extracted values
        let paragraphHtml = paragraph.innerHTML;

        // Apply the conversion (you can replace this logic with your actual conversion)
        let convertedText = unicodekruti(extractedValues[index]);

        // Find content inside [[ ]] and preserve it
        if (paragraphHtml.includes('[[')) {
            let insideBrackets = paragraphHtml.match(/\[\[(.*?)\]\]/g);
            let insideText = insideBrackets ? insideBrackets[0].replace(/[\[\]]/g, '').trim() : '';
            convertedText += ' ' + insideText; // Append the content inside [[ ]] after processing
        }

        // Set the modified text back to the paragraph with <strong> tag
        paragraph.innerHTML = `<strong>${convertedText}</strong>`;
    });

    // Return the final processed HTML
    return tempDiv.innerHTML;
}

function processHtmlKrutiDevToUnicode(htmlContent){
    // Create a temporary container to parse the HTML
    const tempDiv = document.createElement('div');
    tempDiv.innerHTML = htmlContent;

    const paragraphs = tempDiv.querySelectorAll('p');
    let extractedValues = [];

    // Extract the values from the paragraphs (ignoring content inside [[ ]])
    paragraphs.forEach(paragraph => {
        // Get the raw text content, skipping content inside [[ ]]
        let paragraphHtml = paragraph.innerHTML;

        // Extract the text and remove content inside [[ ]] using regex
        let extractedText = paragraphHtml.replace(/\[\[(.*?)\]\]/g, '').replace(/<[^>]+>/g, '').trim();

        // Store the extracted value
        extractedValues.push(extractedText);

        // Store the content inside [[ ]] separately (for the last paragraph)
        if (paragraphHtml.includes('[[')) {
            let insideBrackets = paragraphHtml.match(/\[\[(.*?)\]\]/g);
            extractedValues.push(insideBrackets ? insideBrackets[0].replace(/[\[\]]/g, '').trim() : '');
        }
    });

    // Now, rebuild the HTML with the original structure but with modified text
    paragraphs.forEach((paragraph, index) => {
        // Rebuild the paragraph's HTML with the processed extracted values
        let paragraphHtml = paragraph.innerHTML;

        // Apply the conversion (you can replace this logic with your actual conversion)
        let convertedText = krutiunicode(extractedValues[index]);

        // Find content inside [[ ]] and preserve it
        if (paragraphHtml.includes('[[')) {
            let insideBrackets = paragraphHtml.match(/\[\[(.*?)\]\]/g);
            let insideText = insideBrackets ? insideBrackets[0].replace(/[\[\]]/g, '').trim() : '';
            convertedText += ' ' + insideText; // Append the content inside [[ ]] after processing
        }

        // Set the modified text back to the paragraph with <strong> tag
        paragraph.innerHTML = `<strong>${convertedText}</strong>`;
    });

    // Return the final processed HTML
    return tempDiv.innerHTML;
}
