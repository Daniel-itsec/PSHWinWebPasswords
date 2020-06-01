$exportpath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop) + "\WebPasswords.csv"
[void][Windows.Security.Credentials.PasswordVault,Windows.Security.Credentials,ContentType=WindowsRuntime];
(New-Object Windows.Security.Credentials.PasswordVault).RetrieveAll() | % { $_.RetrievePassword();$_ } | Select-Object UserName, Resource, Password | Export-Csv $exportpath -NoTypeInformation
