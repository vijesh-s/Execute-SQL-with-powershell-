<#

.SYNOPSIS
This is a Powershell script to Execute a SQL script. 

.DESCRIPTION
This script uses the sqlcmd utitlity. You can use Windows Auth or the SQL Auth. 
ExecuteSql and ExecuteSqlWithWindowsAuth functions defined

.EXAMPLE
ExecuteSql Sqlfile.Sql sqlUserName SqlPwd TestDB Server\SqlInstance output.rpt

.EXAMPLE
ExecuteSqlWithWindowsAuth Sqlfilename.Sql TestDB Server\SqlInstance output.rpt
#>


function ExecuteSql($inputSqlFile, $SqluserName, $Sqlpwd, $DbName, $SqlServerInstance, $outputFile) {
   sqlcmd -S $SqlServerInstance -U $SqluserName -P $Sqlpwd -d $DbName -i $inputSqlFile -o $outputFile
}

function ExecuteSqlWithWindowsAuth($inputSqlFile, $DbName, $SqlServerInstance, $outputFile) {
 sqlcmd -S $SqlServerInstance -d $DbName -i $inputSqlFile -o $outputFile
}
