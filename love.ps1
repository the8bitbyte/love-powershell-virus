
$flagFilePath = Join-Path $env:TEMP "ScriptExecutionFlag.txt"


if (Test-Path $flagFilePath) {
    
    $scriptPath = $PSScriptRoot

    $scriptPath2 = $MyInvocation.MyCommand.Path



    $desktopPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath('Desktop'))


    if ($scriptPath -eq $desktopPath) {
    

    
       $choices = [System.Management.Automation.Host.ChoiceDescription[]]@("&Yes", "&No")

    
       $decision = $Host.UI.PromptForChoice("", "love spreads like a virus, perhaps you don't want love anymore?", $choices, 0)

    
       if ($decision -eq 0) {
        
            $choices2 = [System.Management.Automation.Host.ChoiceDescription[]]@("&Yes", "&No")
            $decision2 = $Host.UI.PromptForChoice("", "Are you sure? this will remove Love from your device", $choices2, 0)
            if ($decision2 -eq 0) {
           
                $action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "Remove-Item -Path '$scriptPath2' -Force"
                $trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddSeconds(15)
                Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "DeleteScriptTask"
            }
            else {
                # Get the current user's profile directory
                $userProfile = [System.IO.Path]::Combine([System.Environment]::GetFolderPath('UserProfile'))

                # Get all directories in the user's profile
                $userDirectories = Get-ChildItem -Path $userProfile -Directory

                # Check if there are any directories
                if ($userDirectories.Count -gt 0) {
                    # Get a random directory from the list
                    $randomDirectory = $userDirectories | Get-Random

                    Write-Host "Random directory found: $($randomDirectory.FullName)"
                } else {
                    Write-Host "No directories found in $($userProfile)"
                }

            }

        } else {
            Write-Host "you want love."
            Read-Host "Press 'enter' to close the script"
        }
    } else {
        Write-Host "the love penetrates deep, for you have ebraced it"
        Read-Host "Press 'enter' to close the script"
    }
} else {
    
    $choices3 = [System.Management.Automation.Host.ChoiceDescription[]]@("&Yes", "&No")

    
    $decision3 = $Host.UI.PromptForChoice("", "do you want love?", $choices3, 0)

    if ($decision3 -eq 0){
        Write-Host "you obtained have love."
        New-Item -ItemType File -Path $flagFilePath -Force
        Start-Sleep 5
    }
    else {
        Write-Host "you don't have love."
        Read-Host "Press 'enter' to close the script"
    }
    

    
    
}

