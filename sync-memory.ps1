# Qwen Sync для PowerShell (Windows)
# Использование: .\sync-memory.ps1

Write-Host "🔄 Синхронизация с GitHub..."

Set-Location ~/.qwen

# Проверка изменений
$status = git status --porcelain
if ($status) {
    Write-Host "📝 Есть изменения..."
    git add QWEN.md mcp.json settings.json
    git commit -m "Sync memory: $(Get-Date -Format 'yyyy-MM-dd HH:mm')" --quiet
    git pull origin main --rebase --quiet
    git push origin main --quiet
    Write-Host "✅ Синхронизация завершена"
} else {
    Write-Host "✅ Нет изменений. Проверяем обновления..."
    git pull origin main --quiet
    Write-Host "✅ Всё актуально"
}
