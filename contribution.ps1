$repoDir = "D:\GitHub\contribution-shell"
$commitMessage = "Automatic commit from Task Scheduler"
$remoteUrl = "https://github.com/44filip/contribution-shell.git"

# Navigating to the directory
Start-Process cmd -ArgumentList "/c cd \"$repoDir\"" -Wait