# 🔄 Синхронизация памяти Qwen Code

## ⚡ Быстрый старт (GitHub)

```bash
# 1. Создайте репозиторий на GitHub
# 2. Выполните:
cd ~/.qwen && git init && git add . && git commit -m "Init"
git remote add origin https://github.com/YOUR_USERNAME/qwen-memory.git
git push -u origin main

# 3. На другом компьютере:
git clone https://github.com/YOUR_USERNAME/qwen-memory.git ~/.qwen
```

## 📦 Бэкап

```bash
qwen-backup  # Создать бэкап
qwen-restore ~/Downloads/memory-backup-*.tar.gz  # Восстановить
```

## ☁️ Облако (Supabase)

См. `~/.qwen/CLOUD_SETUP.md` — автоматическая синхронизация через облачную БД

## 📚 Полная инструкция

См. `~/.qwen/SYNC_GUIDE.md`
