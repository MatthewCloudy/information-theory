function ConvertImage{
	$path="$PSScriptRoot/../originals" #path to files
	if (Test-Path $path)
 {
#Load required assemblies and get object reference
    [Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null
    foreach($file in (Get-ChildItem "$path\*.jp*g")){
        $convertfile = new-object System.Drawing.Bitmap($file.Fullname)
        $newfilname = ($file.Fullname -replace '([^.]).jpe?g','$1') + ".png"
        $convertfile.Save($newfilname, "png")
        $file.Fullname
        $convertfile.Dispose()
    }  
 }
	else
 {
    Write-Host "Path not found."
 }
};
ConvertImage

#Get-ChildItem "$PSScriptRoot/../originals/*.png" | ForEach-Object { python rgb2grayscale.py $_ }