$files = Get-Content C:\Utils\DailyBackup\FileList.ini;
New-Item -ItemType Directory -Force -Path C:\Utils\DailyBackup\Temp;
Copy-Item $files -Destination C:\Utils\DailyBackup\Temp;
$archive = "C:\Utils\DailyBackup\$(Get-Date -f yyyy-MM-dd).zip"
Compress-Archive -Path C:\Utils\DailyBackup\Temp -Force -CompressionLevel Optimal -DestinationPath $archive;
Move-Item $archive -Destination D:\OneDrive\Work\backups -Force
Remove-Item -Path C:\Utils\DailyBackup\Temp -Recurse;