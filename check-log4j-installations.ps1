gci 'C:\' -rec -force -include *.jar -ea 0 | foreach {select-string "JndiLookup.class" $_} | select -exp Path | Send-MailMessage -From 'Sender <sender@email.com>' -To 'Recipient <recipient@email.com>' -Subject 'Log4J Scan Results' -SmtpServer 'smtp.email.com'
