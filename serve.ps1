# Start the Jekyll dev server (local preview at http://localhost:4000)
$rubyBin = "C:\Ruby40-x64\bin"
if (Test-Path $rubyBin) {
    $env:Path = "$rubyBin;" + $env:Path
}

Set-Location $PSScriptRoot

Write-Host "Installing gems..." -ForegroundColor Cyan
bundle install
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host ""
Write-Host "Starting Jekyll at http://localhost:4000" -ForegroundColor Green
Write-Host "Press Ctrl+C to stop." -ForegroundColor Yellow
Write-Host ""

bundle exec ruby -r ./jekyll_bootstrap.rb -S jekyll serve -l -H localhost
