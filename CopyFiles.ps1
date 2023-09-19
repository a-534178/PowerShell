# Скрипт рекурсивно проходит по каталогу $UpdatePath
# Выполняет копирование всех найденных файлов с расширением .cab в -Destination
$UpdatePath = "C:\Users\a534178.INT\Documents\Backup\Documents\PS Scripts\Test"
Get-ChildItem -Path $UpdatePath -Recurse -Include *.cab* | ForEach-Object -Process {
    $path = $_.DirectoryName+'\'+$_.Name
   # $path}
    Copy-Item $path -Destination ''}