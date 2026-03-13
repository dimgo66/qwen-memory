# Qwen Remember для PowerShell (Windows)
# Использование: .\remember.ps1 "user: факт"

param(
    [Parameter(Mandatory=$true)]
    [string]$fact
)

# Парсинг: "сущность: факт" или просто "факт"
if ($fact -match "^([^:]+):\s*(.+)$") {
    $entity = $matches[1].Trim()
    $content = $matches[2].Trim()
} else {
    $entity = "user"
    $content = $fact
}

Write-Host "💾 Сохранение: $entity: $content"

# Сохранение в PostgreSQL
$result = psql -U postgres -d mcp_memory -t -c "INSERT INTO observations (entity_name, content) VALUES ('$entity', '$content') RETURNING '✅ Сохранено: ' || entity_name || ': ' || content;" 2>&1
Write-Host $result

# Обновление QWEN.md
Write-Host "📝 Обновление QWEN.md..."
& bash ~/.qwen/update-qwen-md.sh

# Синхронизация с GitHub
Write-Host "🔄 Синхронизация с GitHub..."
Set-Location ~/.qwen
git add QWEN.md
git commit -m "Memory update: $content" --quiet
git push origin main --quiet

Write-Host "✅ Сохранено и синхронизировано!"
