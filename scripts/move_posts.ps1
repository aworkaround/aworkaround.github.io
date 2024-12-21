[CmdletBinding()]
param (
    [Parameter()]
    [String]
    $SourceDir = 'G:\My Drive\Obsidian\YouTube',
    [Parameter()]
    [String]
    $DestDir = '.\'
)

$SourceImgDir = Join-Path -Path $SourceDir -ChildPath 'Attachments'
$DestImgDir = Join-Path -Path $DestDir -ChildPath '.\assets\img'
$DestPostsDir = Join-Path -Path $DestDir -ChildPath '.\_posts'

if (-Not (Test-Path $SourceDir)) {
    Write-Error "Provided SourceDir: $SourceDir does not exist!"
    break
}
if (-Not (Test-Path $SourceImgDir)) {
    Write-Error "Attachments folder does not exist in $SourceDir!"
    break
}
if (-Not (Test-Path $DestImgDir)) {
    Write-Error 'Folder assets\img does not exist inside DestDir!'
    break;
}
if (-Not (Test-Path $DestPostsDir)) {
    Write-Error 'Folder _posts does not exist inside DestDir!'
    break;
}
$ExcludedImages = (Get-ChildItem -Path $DestImgDir -Recurse -Depth 5).Name
$ExcludedPosts = (Get-ChildItem -Path $DestPostsDir -Recurse -Depth 5).Name
$ImagesToBeCopied = Get-ChildItem -Path $SourceImgDir -Exclude $ExcludedImages -Recurse -Depth 5 -Force
if ($ImagesToBeCopied) {
    Copy-Item -Path $ImagesToBeCopied -Destination $DestImgDir -Force -Recurse
}
Write-Host "Total $($ImagesToBeCopied.Count) images are copied!"

$PostsToBeCopied = Get-ChildItem -Path $SourceDir -Exclude $ExcludedPosts -Recurse -Depth 5 -Force | Where-Object Name -Like '*.md'
if ($PostsToBeCopied) {
    $PublishDate = (Get-Date -Format 'yyyy-MM-dd')
    Write-Host 'Note: If you have list of items, please use comma (,) as a separator.' -ForegroundColor Yellow
    foreach ($Post in $PostsToBeCopied) {
        $PostContent = Get-Content $Post.FullName
        $PostContent = $PostContent.Replace('<$publish_date>', "$PublishDate")
        $Variables = (($PostContent -match '<\$.*>').Split('<') -match '>').split('>') | Where-Object { $_ -Like '$*' } | Sort-Object -Unique
        foreach ($Var in $Variables) {
            $Value = Read-Host "Please type $Var for $($Post.Name)"
            $PostContent = $PostContent.Replace("<$Var>", $Value.Split(',') -Join ', ')
        }
        Set-Content -Value $PostContent -Path $Post.FullName
    }
    Copy-Item -Path $PostsToBeCopied -Destination $DestPostsDir -Force -Recurse
}
Write-Host "Total $($PostsToBeCopied.Count) posts are copied!"