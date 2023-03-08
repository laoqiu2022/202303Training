$rootFolder = "D:\04_ITトレーニング\2023年03月期\20230304\202303Training\SampleFileWork"
# 要遍历的根文件夹路径

Get-ChildItem -Path $rootFolder -Recurse | Sort-Object -Property Name -Descending | ForEach-Object {
    if($_.PSIsContainer) {
        # 如果是文件夹，执行以下代码
        Write-Host "文件夹: " $_.FullName
    }
    else {
        # 如果是文件，执行以下代码
        Write-Host "文件: " $_.Name
		Rename-Item -Path $_.FullName `
		-NewName ($_.LastWriteTime.ToString('yyyyMMdd-HHmmss.fff') + '-' + $_.BaseName + $_.Extension)
    }
}
