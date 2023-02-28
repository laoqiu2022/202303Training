$inputForlder = ""

if(![string]::IsNullorEmpty($args[0])){
    if(Test-Path $args[0]){
        $inputForlder = $args[0]
    }
    else{
        Write-Host("Forlder not exist.") -BackgroundColor Blue;
        return
    }
}

if($inputForlder -ne ""){
    Get-ChildItem -Path $inputForlder | ForEach-Object -Process{
        if($_ -is [System.IO.FileInfo])
        {
            #Write-Host($_.CreationTime);
            #Write-Host($_.FullName);

            Rename-Item -Path $_.FullName `
            -NewName ($_.LastWriteTime.ToString('yyyyMMdd-HHmmss.fff') + '-' + $_.BaseName + $_.Extension)
        }
    }
}
else{
    Write-Host("Forlder is empty.") -BackgroundColor Blue;
}
