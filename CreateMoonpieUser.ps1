$password = ConvertTo-SecureString -String "password" -AsPlainText -Force
$User = "username"
$op = Get-LocalUser | Where-Object {$_.Name -eq $User}
If ( -not $op)
{
New-LocalUser $User -Password $Password -PasswordNeverExpires -FullName $User
Add-LocalGroupMember -Group "Administrators" -Member $User
}