# Memory Command

## Описание
Просмотр и управление долгосрочной памятью.

## Команды

### Показать всю память
```
/memory
```

### Сохранить факт
```
/remember <факт>
/remember <сущность>: <факт>
```

### Примеры
```
/remember Пользователь предпочитает светлую тему
/remember user: Владеет Python и TypeScript
/remember project: Использует PostgreSQL для памяти
```

## Хранение
- **База:** mcp_memory (PostgreSQL)
- **Таблицы:** entities, observations, relations
- **Автозагрузка:** в начале каждой сессии
