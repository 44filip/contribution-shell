# (Redundant) backup case for missing path
if (!(Test-Path -Path $filePath -PathType Directory)) {
    New-Item -ItemType Directory -Path $filePath -Force
}

$repoDir = "D:\GitHub\contribution-shell"
$commitMessage = "Automatic commit from Task Scheduler"

# Text file generation
$dateTime = Get-Date -Format "dd/MM/yyyy"
$filePath = Join-Path $repoDir "text_files\$dateTime.txt"

# Creating the empty text file
New-Item -ItemType File -Path $filePath -Force

# Navigating to the repository directory
Set-Location -Path $repoDir

# Checking for uncommitted changes
$changes = git status --porcelain
if ($changes) {
    # Add all the uncommitted changes, then commit, and push
    git add .
    git commit -m $commitMessage

    # Determine the remote name dynamically
    $remoteName = (git remote -v | Select-String -Pattern "(\S+)\s+https:\/\/github\.com" | ForEach-Object { $_.Matches.Groups[1].Value })[0]

    # Push to the determined remote
    git push -u $remoteName main
}
else {
    Write-Host "No changes to commit."
}
