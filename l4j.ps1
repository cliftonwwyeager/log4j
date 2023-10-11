# Store the found paths in a list
$foundPaths = @()

# Search for .jar files and check for the string
Get-ChildItem 'C:\' -Recurse -Force -Include *.jar -ErrorAction SilentlyContinue | ForEach-Object {
    # Check if "JndiLookup.class" string exists in the file
    if (Select-String -Pattern "JndiLookup.class" -Path $_.FullName -Quiet) {
        # Add the path to the list
        $foundPaths += $_.FullName
    }
}

# Send an email if any paths were found
if ($foundPaths.Count -gt 0) {
    $emailBody = $foundPaths -join "`r`n"
    Send-MailMessage -From 'Sender <sender@email.com>' -To 'Recipient <recipient@email.com>' -Subject 'Log4J Scan Results' -Body $emailBody -SmtpServer 'smtp.email.com'
}
