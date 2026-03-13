#!/bin/bash
# Синхронизация памяти с GitHub

QWEN_DIR="$HOME/.qwen"
REPO_URL="https://github.com/YOUR_USERNAME/qwen-memory.git"

cd "$QWEN_DIR"

# Проверяем, есть ли изменения
if git status --porcelain | grep -q .; then
    echo "📝 Есть изменения..."
    
    # Обновляем QWEN.md из БД
    ./update-qwen-md.sh
    
    # Коммитим и пушим
    git add QWEN.md mcp.json settings.json skills/
    git commit -m "Sync memory: $(date '+%Y-%m-%d %H:%M')"
    git pull origin main --rebase 2>/dev/null || true
    git push origin main
    
    echo "✅ Синхронизация завершена"
else
    echo "✅ Нет изменений. Проверяем обновления..."
    git pull origin main 2>/dev/null || echo "⚠️ Нет подключения к интернету или репозиторий не настроен"
fi
