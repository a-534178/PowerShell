<#
Скрипт делает следующее: рекурсивно вытаскивает все папки внутри $path, f pfntv
вытаскивает ACL для каждой папки, формируя массив объектов для последующий выгрузки в 
CSV файл.

#>
# Указываем путь к папке с которой будем работать
$path = ""

# Получаем список всех папок внутри $path рекурсивно
$folders = Get-ChildItem -Path $path -Recurse -Attributes Directory -Name

# Массив с результатами
$summary = @()

foreach ($folder in $folders){
    $check = $path+$folder
    $result = Get-Acl -Path $check
    

    $res = [PSCustomObject]@{
        Directory = $result.Path.TrimStart("Microsoft.PowerShell.Core\FileSystem::")
        Access = (@(($result.Access).IdentityReference) -join ',')
        }
    
    $summary+=$res
    
    }

$summary | Out-GridView