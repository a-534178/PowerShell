<#
Скрипт делает следующее: рекурсивно вытаскивает все папки внутри $path, f pfntv
вытаскивает ACL для каждой папки, формируя массив объектов для последующий выгрузки в 
CSV файл.

#>
# Указываем путь к папке с которой будем работать
$path = ""

# Получаем список всех папок внутри $path рекурсивно, изменяя параметр Depth можно контроллировать глубину поиска
$folders = Get-ChildItem -Path $path -Depth 3 -Recurse -Attributes Directory -Name

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