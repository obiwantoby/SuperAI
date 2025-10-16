# SuperAI - Quick Install/Update Script

## Copy mod to PA mods folder
Write-Host "Copying SuperAI v1.0.2 to PA mods folder..." -ForegroundColor Cyan

$source = "c:\Users\Brandon\dev\mods\com.pa.super.ai"
$dest = "$env:LOCALAPPDATA\Uber Entertainment\Planetary Annihilation\mods\com.pa.super.ai"

# Remove old version if exists
if (Test-Path $dest) {
    Write-Host "Removing old version..." -ForegroundColor Yellow
    Remove-Item $dest -Recurse -Force
}

# Copy new version
Write-Host "Installing v1.0.2..." -ForegroundColor Green
Copy-Item -Recurse $source $dest

Write-Host "`n✅ SuperAI v1.0.2 installed!" -ForegroundColor Green
Write-Host "`nNext steps:" -ForegroundColor Yellow
Write-Host "1. Launch PA (or restart if running)" -ForegroundColor White
Write-Host "2. Go to Settings → Mods → Verify 'SuperAI' is enabled" -ForegroundColor White
Write-Host "3. Start Skirmish → Add AI → Look for 'SuperAI'" -ForegroundColor White
Write-Host "`nIf still not appearing, check dependencies:" -ForegroundColor Cyan
Write-Host "  • com.pa.brandon.paragon" -ForegroundColor Gray
Write-Host "  • pa.mla.unit.addon (Second Wave)" -ForegroundColor Gray
Write-Host "`nChanges in v1.0.2:" -ForegroundColor Cyan
Write-Host "  • Fixed: Context back to 'server' (like Queller)" -ForegroundColor White
Write-Host "  • Fixed: Removed Queller dependency" -ForegroundColor White
Write-Host "  • Fixed: JS matches Legion pattern exactly" -ForegroundColor White
