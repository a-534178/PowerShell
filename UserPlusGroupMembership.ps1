<#
Скрипт формирует отчет в GridView или в csv файл, где видно какой пользователь в каких группах состоит.
В качестве входных парметров мы задаем OU из которых мы будем брать пользователей и производить анализ 
их членства в группах AD.
#>
$users = Get-ADUser -SearchBase "" -SearchScope OneLevel -Filter * -Properties *
$users.count
$result = @()

foreach ($user in $users){
    
    
    
    $groups = Get-ADPrincipalGroupMembership $user | select name

    $res = [PSCustomObject]@{
        SamAccountName = $user.SamAccountName
        DisplayName = $user.DisplayName
        Groups = (@($groups.Name) -join ',')
        }

        $result+=$res
        $res
       
    }
$result | Out-GridView
#$result #| Export-Csv "C:\Temp" -Encoding UTF8 -NoTypeInformation