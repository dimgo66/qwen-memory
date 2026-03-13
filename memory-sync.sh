#!/bin/bash
# Экспорт/импорт памяти для синхронизации между компьютерами

ACTION=$1

case "$ACTION" in
    export)
        echo "📦 Экспорт памяти..."
        
        # Создаём дамп
        psql -U mac -d mcp_memory -c "COPY (SELECT * FROM entities) TO STDOUT WITH CSV HEADER" > ~/.qwen/memory_entities.csv 2>/dev/null
        psql -U mac -d mcp_memory -c "COPY (SELECT * FROM observations) TO STDOUT WITH CSV HEADER" > ~/.qwen/memory_observations.csv 2>/dev/null
        psql -U mac -d mcp_memory -c "COPY (SELECT * FROM relations) TO STDOUT WITH CSV HEADER" > ~/.qwen/memory_relations.csv 2>/dev/null
        
        # Архивируем
        tar -czf ~/.qwen/memory-backup-$(date +%Y%m%d).tar.gz \
            ~/.qwen/memory_*.csv \
            ~/.qwen/QWEN.md \
            ~/.qwen/mcp.json \
            2>/dev/null
        
        echo "✅ Бэкап создан: ~/.qwen/memory-backup-$(date +%Y%m%d).tar.gz"
        echo ""
        echo "📤 Отправьте этот файл на другой компьютер и выполните:"
        echo "   ~/.qwen/memory-sync.sh import <файл>"
        ;;
        
    import)
        if [ -z "$2" ]; then
            echo "❌ Укажите файл: ~/.qwen/memory-sync.sh import <файл.tar.gz>"
            exit 1
        fi
        
        echo "📥 Импорт памяти из: $2"
        
        # Распаковываем
        tar -xzf "$2" -C ~/.qwen/ 2>/dev/null
        
        # Импортируем в БД
        psql -U mac -d mcp_memory -c "TRUNCATE entities, observations, relations CASCADE;" 2>/dev/null
        psql -U mac -d mcp_memory -c "\copy entities FROM '$HOME/.qwen/memory_entities.csv' WITH CSV HEADER" 2>/dev/null
        psql -U mac -d mcp_memory -c "\copy observations FROM '$HOME/.qwen/memory_observations.csv' WITH CSV HEADER" 2>/dev/null
        psql -U mac -d mcp_memory -c "\copy relations FROM '$HOME/.qwen/memory_relations.csv' WITH CSV HEADER" 2>/dev/null
        
        # Обновляем QWEN.md
        ~/.qwen/update-qwen-md.sh
        
        echo "✅ Память импортирована!"
        ;;
        
    sync)
        # Быстрая синхронизация через Git
        ~/.qwen/sync-memory.sh
        ;;
        
    *)
        echo "📋 Использование:"
        echo "  ~/.qwen/memory-sync.sh export   - Экспорт памяти"
        echo "  ~/.qwen/memory-sync.sh import <файл> - Импорт памяти"
        echo "  ~/.qwen/memory-sync.sh sync     - Синхронизация через Git"
        echo ""
        echo "🌐 Для облачной синхронизации см. ~/.qwen/CLOUD_SETUP.md"
        ;;
esac
