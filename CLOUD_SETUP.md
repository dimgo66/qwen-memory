# 🌐 Настройка облачной памяти (Supabase)

## 1. Создайте аккаунт на https://supabase.com

## 2. Создайте новый проект
- Название: `qwen-memory`
- Пароль базы: (сохраните!)
- Регион: выберите ближайший

## 3. Получите credentials
В Settings → API:
- **Project URL**: `https://xxxxx.supabase.co`
- **Anon/Public Key**: `eyJhbG...`

## 4. Создайте таблицу

Зайдите в SQL Editor и выполните:

```sql
-- Entities (сущности)
CREATE TABLE entities (
    name TEXT PRIMARY KEY,
    entity_type TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Observations (наблюдения)
CREATE TABLE observations (
    id SERIAL PRIMARY KEY,
    entity_name TEXT REFERENCES entities(name) ON DELETE CASCADE,
    content TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Relations (связи)
CREATE TABLE relations (
    id SERIAL PRIMARY KEY,
    from_entity TEXT REFERENCES entities(name),
    to_entity TEXT REFERENCES entities(name),
    relation_type TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Индексы для скорости
CREATE INDEX idx_observations_entity ON observations(entity_name);
CREATE INDEX idx_relations_from ON relations(from_entity);
CREATE INDEX idx_relations_to ON relations(to_entity);
```

## 5. Обновите ~/.qwen/mcp.json

Замените локальный memory сервер на облачный:

```json
{
  "mcpServers": {
    "memory": {
      "command": "mcp-server-memory",
      "args": [],
      "env": {
        "DATABASE_URL": "postgresql://postgres:[PASSWORD]@db.xxxxx.supabase.co:5432/postgres"
      }
    }
  }
}
```

## 6. Настройте второй компьютер

На другом компьютере:
1. Установите Qwen Code
2. Скопируйте `~/.qwen/mcp.json` с облачными настройками
3. Память будет синхронизироваться автоматически!

---

**Преимущества:**
- ✅ Автоматическая синхронизация
- ✅ Доступ с любого устройства
- ✅ Резервное копирование
- ✅ Бесплатно (500MB достаточно)
