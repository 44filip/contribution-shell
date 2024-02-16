$repoDir = "D:\GitHub\contribution-shell"
$commitMessage = "Automatic commit from Task Scheduler"
$remoteUrl = "https://github.com/44filip/contribution-shell.git"

# Navigating to the directory
Start-Process cmd -ArgumentList "/c cd \"$repoDir\"" -Wait

# Checking for uncommitted changes
$changes = git status --porcelain
if ($changes) {
    # Add all the uncommitted changes, then commit, and push
    git add -a
    git commit -m "$commitMessage"
    git push -u origin main 
}
else {
    Write-Host "No changes to commit."
}