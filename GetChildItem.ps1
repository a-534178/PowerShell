#Формирование списка файлов с путями из папки с множеством вложенных папок
$UpdatePath = "C:\temp\W2k12patches"
Get-ChildItem -Path $UpdatePath -Recurse -Include *.cab* | ForEach-Object -Process {
                                                           'DISM.exe /Online /Add-Package /PackagePath:'+$_.Name | Out-File -FilePath C:\temp\updatelist.txt -Append}