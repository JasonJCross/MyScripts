Get-ChildItem -Recurse | Where-Object {$_.PSIsContainer -eq $True} | ForEach-Object {
    $folder = $_
    $size = (Get-ChildItem $folder.FullName -Recurse | Measure-Object -Property Length -Sum).Sum
    [pscustomobject]@{
        Folder = $folder.FullName
        Size = $size
    }
} | Sort-Object -Property Size -Descending
