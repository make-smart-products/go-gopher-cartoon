$ErrorActionPreference = "Stop"
Set-Location "C:\Users\effre\VS(Go)\go-gopher-cartoon"

$log = Join-Path (Get-Location) "push-result.txt"
function Log($text) {
    Add-Content -Path $log -Value $text
    Write-Host $text
}

if (Test-Path $log) { Remove-Item $log -Force }
Log "=== push started $(Get-Date -Format o) ==="

git remote set-url origin git@github.com:make-smart-products/go-gopher-cartoon.git
Log "remote:"
Log (git remote -v | Out-String).Trim()

git add -A
$status = git status --short
Log "status:"
Log $status

if ($status) {
    git commit -m @"
Extract cartoon into standalone repository.

Remove the fitness tracker Go module and keep only the static cartoon site.
"@
    Log "commit:"
    Log (git log -1 --oneline)
} else {
    Log "nothing to commit"
}

$current = git branch --show-current
if ($current -ne "main") {
    git branch -M main
    Log "renamed branch to main"
}

Log "push:"
git push -u origin main 2>&1 | ForEach-Object { Log $_ }
if ($LASTEXITCODE -ne 0) {
    Log "SSH push failed, trying HTTPS..."
    git remote set-url origin https://github.com/make-smart-products/go-gopher-cartoon.git
    git push -u origin main 2>&1 | ForEach-Object { Log $_ }
}

Log "=== push finished exit=$LASTEXITCODE ==="
