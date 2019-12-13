<#

.SYNOPSIS
This is a Powershell script to Execute a SQL script. 

.DESCRIPTION
This script will use the sqlcmd utility. 
You can use Windows auth or the SQL Auth. 

 
.EXAMPLE
./ExecuteSqlInteractive.ps1
Enter the SQL file name: Sqlfile.Sql
Enter the SqlServer Intance: Server\SqlInstance
Enter the Database name: TestDB
Do you want to use windows authentication y or n?: n
Enter the username: sqlUserName
Enter the password: sqlPwd
Enter the output file name, for e.g output.rpt: output.rpt

.EXAMPLE
./ExecuteSqlInteractive.ps1
Enter the fullname of the SQL file: Sqlfile.Sql
Enter the SqlServer Intance: Server\SqlInstance
Enter the Database name: TestDB
Do you want to use Windows Authentication, y or n?: y
Enter the output file name, for e.g output.rpt: output.rpt

.NOTES
Make sure ExecuteSql.ps1 exists in the same directory


#>

. ".\RunSql.ps1"

$inputSqlFile = read-host "Enter the SQL file name"
if (-Not ($inputSqlFile -Like "*.sql"))
{
    Write-Host "Please enter a sql file."
    return
}
$SqlServerInstance = read-host "Enter the SqlServer Intance"
$DbName = read-host "Enter the Database name"
$useWindowsAuth = read-host "Do you want to use Windows Authentication, y or n?"

$useWindowsAuth = $false

if($useWindowsAuth -eq "y") {
   $useWindowsAuth = $true
   
}
else {
   $SqluserName = read-host "Enter the username"
   $Sqlpwd = read-host "Ënter the password"
}

$outputFile = read-host "Enter the output file name, for e.g output.rpt"
if($useWindowsAuth) {
   RunSqlWithWindowsAuth $inputSqlFile $DbName $SqlServerInstance $outputFile
}
else
{
   RunSql $inputSqlFile $SqluserName $Sqlpwd $DbName $SqlServerInstance $outputFile
}
