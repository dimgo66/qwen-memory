# Память Qwen Code

## 👤 Информация о пользователе

- **User:** Имя: Дмитрий Алексеевич, Профессия: дизайнер, Язык: русский, Дата рождения: 20 мая 1966 года, Место рождения: Москва

## 📚 Навыки и предпочтения

- Предпочитает русский язык для общения
- Использует macOS

## 🔌 MCP Серверы (подключены)

### Основные
- `filesystem` — файловая система /Users/mac
- `git` — Git операции

### Память и данные
- `postgres-memory` — долгосрочная память сессий (localhost:3001)
- `memory` — долгосрочная память PostgreSQL
- `postgres` — SQL запросы

### Браузер и автоматизация
- `puppeteer` — браузерная автоматизация
- `playwright` — браузерная автоматизация (альтернатива)

### Инструменты
- `sequentialthinking` — структурированное мышление
- `context7` — документация npm пакетов
- `pdf` — работа с PDF
- `github` — Issue/PR lookup (требует GITHUB_TOKEN env var)

## 📁 Проекты

### Mister Kamysh
- Backend: Python (FastAPI)
- Frontend: React
- Ports: 8000 (API), 3000 (Frontend)

### Агачер Конкурс
- Сайт: konkurs-minmv
- GitHub: https://github.com/dimgo66/konkurs-minmv

---

*Последнее обновление: 27 марта 2026*

## Active MCP Servers

- **postgres-memory**: Long-term session memory (localhost:3001)
- **github**: Issue/PR lookup (requires GITHUB_TOKEN env var)
- **context7**: Documentation lookup

---

## Qwen Added Memories
- Навыки Vanilla JS архитектуры: 1) BaseModule класс с lifecycle (loadDependencies, setupEventListeners, onInit), 2) BaseComponent с render(), show/hide, template loading, 3) Модульная система с EventEmitter для межмодульной коммуникации, 4) CSS Custom Properties для дизайн-токенов (colors, spacing, typography), 5) Tailwind CSS + кастомные утилиты, 6) Модальные окна: overlay + box с absolute positioning и transform translate для центрирования, 7) Event delegation для динамических элементов, 8) Context menu с позиционированием относительно клика, 9) Drag & Drop с custom dragImage, 10) localStorage token auth с middleware проверкой
- Организация проекта и git: 1) Чистая структура с разделением components/services/styles/templates/utils, 2) Комплексный .gitignore для AI assistants (.crush, .qwen, .roo, .windsurf и др.), бэкапов, тестов, отчётов, 3) Модульные CSS файлы по назначению (auth, buttons, cards, forms, modals, sidebar, header, layout), 4) Utilities separate (focus, interactive-states, mobile-responsive, scrollbars), 5) Design tokens в base/design-tokens.css, 6) Коммиты с понятными префиксами (Refactor, Fix, Add), 7) Перед коммитом: git status, git diff HEAD --stat, git log -n 3 для стиля
- MCP Серверы: filesystem (/Users/mac), memory (PostgreSQL долгосрочная память), postgres (SQL запросы), puppeteer (браузерная автоматизация), sequentialthinking (структурированное мышление), git (Git операции)
- MCP Серверы: filesystem (/Users/mac), memory (PostgreSQL долгосрочная память), postgres (SQL запросы), puppeteer (браузерная автоматизация), sequentialthinking (структурированное мышление), git (Git операции), playwright (браузерная автоматизация), context7 (документация npm пакетов), pdf (работа с PDF)
- Методология Memory Bank: Обязательное чтение ВСЕХ файлов Банка памяти в начале КАЖДОЙ сессии. Структура: projectbrief.md (фундамент) → productContext.md, systemPatterns.md, techContext.md → activeContext.md → progress.md. Два режима: Планирование (анализ→вопросы→план→утверждение→выполнение) и Действие (контекст→обновление документации→выполнение→документирование). .warprules — журнал обучения проекта (паттерны, предпочтения). Обновление при: новых паттернах, значительных изменениях, запросе "update memory bank".
- Рабочие правила: 1) После изменений кода всегда commit и push в GitHub с описательным сообщением, 2) Перед редактированием файла обязательно перечитать его для точного matching текста, 3) Для армянского/кириллицы проверять поддержку шрифтов (Playfair Display ✓, Bodoni Moda ✗), 4) Сверять цвета с референсом перед финализацией (#666945 зелёный, #fffcbb кремовый)
- Не делать коммиты после каждого действия. Коммитить и делать push только после явной просьбы пользователя.
- GSD для Qwen Code установлен в ~/.qwen/gsd/. Команды для использования: gsd:new-project (инициализация), gsd:map-codebase (анализ существующего проекта), gsd:plan-phase N, gsd:execute-phase N, gsd:verify-work, gsd:ship, gsd:progress, gsd:help. Структура .planning/: PROJECT.md, REQUIREMENTS.md, ROADMAP.md, STATE.md. Использовать методологию Get Shit Done v1.29.0 адаптированно для Qwen Code.
- GSD команды для Qwen Code включают флаги: gsd:discuss-phase [N] (базовый), gsd:discuss-phase [N] --auto (автоматический анализ), gsd:discuss-phase [N] --analyze (глубокий анализ компромиссов с tradeoff таблицей).
- GSD для Qwen Code — полный список команд: Core (gsd:new-project, gsd:map-codebase, gsd:discuss-phase [--auto/--analyze], gsd:plan-phase, gsd:execute-phase, gsd:verify-work, gsd:ship, gsd:next); UI (gsd:ui-phase [--detailed], gsd:ui-review [--strict/--report]); Навигация (gsd:progress, gsd:manager [--interactive/--overview], gsd:help); Управление (gsd:add-phase, gsd:remove-phase, gsd:insert-phase, gsd:pause-work, gsd:resume-work); Исследования (gsd:research-phase, gsd:audit-milestone, gsd:audit-uat, gsd:health); Отладка (gsd:debug, gsd:forensics, gsd:validate-phase, gsd:review); Быстрые (gsd:quick, gsd:do, gsd:note). Структура .planning/: PROJECT.md, REQUIREMENTS.md, ROADMAP.md, STATE.md, ui-specs/, audits/.
- GSD для Qwen Code — полный список команд (v1.29.0): Core (gsd:new-project, gsd:map-codebase, gsd:discuss-phase [--auto/--analyze/--batch], gsd:plan-phase, gsd:execute-phase, gsd:verify-work, gsd:ship, gsd:next); UI (gsd:ui-phase [--detailed], gsd:ui-review [--strict/--report]); Навигация (gsd:progress, gsd:manager [--interactive/--overview], gsd:help, gsd:update, gsd:settings, gsd:set-profile, gsd:stats, gsd:health [--repair]); Управление фазами (gsd:add-phase, gsd:remove-phase, gsd:insert-phase, gsd:list-phase-assumptions, gsd:pause-work, gsd:resume-work); Быстрые задачи (gsd:quick [--discuss/--research/--full], gsd:do, gsd:note, gsd:check-todos); Исследования (gsd:research-phase, gsd:audit-milestone, gsd:audit-uat, gsd:forensics); Отладка (gsd:debug, gsd:validate-phase, gsd:review, gsd:pr-branch); Workstreams (gsd:workstreams list/create/switch/complete); Сессии (gsd:session-report); Backlog (gsd:plant-seed, gsd:add-backlog, gsd:review-backlog, gsd:thread); Утилиты (gsd:health, gsd:stats, gsd:profile-user, gsd:join-discord). Структура .planning/: PROJECT.md, REQUIREMENTS.md, ROADMAP.md, STATE.md, config.json, codebase/, ui-specs/, audits/, todos/, threads/, seeds/, quick/.
- GSD Auto-распознавание: Когда пользователь описывает задачу обычным языком, автоматически определять подходящий GSD воркфлоу и запускать его. Если намерение неясно — задать уточняющий вопрос с вариантами. Примеры: "начать проект" → gsd:new-project, "анализ кода" → gsd:map-codebase, "быстро сделать" → gsd:quick, "проверить UI" → gsd:ui-review, "спланировать" → gsd:plan-phase. Не требовать от пользователя запоминания команд — он пишет естественно, ИИ распознаёт.
- GSD + MCP/Skills авто-подключение: При выполнении GSD-воркфлоу автоматически подключать нужные MCP серверы и Skills. MCP: filesystem (анализ файлов), postgres (данные проекта), puppeteer/playwright (UI тестирование), git (коммиты), memory (контекст между сессиями). Skills: anthropic-frontend-design (UI задачи), web-design-guidelines (UI review), vercel-react-best-practices (React код), review (code review). Пример: gsd:map-codebase → filesystem MCP; gsd:ui-review → web-design-guidelines skill + puppeteer MCP; gsd:execute-phase → git MCP; gsd:new-project → memory MCP для сохранения контекста.
- GSD для Qwen Code — финальная конфигурация: Установлен в ~/.qwen/gsd/. 17 воркфлоу файлов, 40+ команд. MCP/Skills авто-подключение: filesystem (всегда), git (коммиты/ship), memory (контекст), postgres (БД), puppeteer (UI тесты). Skills: anthropic-frontend-design (UI), web-design-guidelines (UI review), vercel-react-best-practices (React), review (code review). Документы: README.md, INSTRUCTION.md, FULL_DOCS.md, MCP_SKILLS_MATRIX.md. Пользователь пишет задачи обычным языком — ИИ автоматически распознаёт намерение, определяет воркфлоу, подключает MCP/Skills.
- GitHub синхронизация: Репозиторий https://github.com/dimgo66/qwen-memory для хранения важных данных Qwen Code. Периодически коммитить и делать push: новые GSD воркфлоу, обновлённые skills, важные изменения в QWEN.md, новые commands, MCP конфигурации. После значительных изменений: git add . && git commit -m "Описание" && git push origin main. Это позволяет восстановить навыки на любом компьютере.
- Рабочие правила Qwen Code: 1) File Editing: всегда read_file перед edit, grep_search для поиска текста, re-read если edit не удался. 2) Non-Latin шрифты: использовать Playfair Display для армянского/кириллицы (Bodoni Moda не поддерживает). 3) Docker/Deployment: проверять конфиги перед Vercel, тестировать connectivity, проверять конфликты портов (Vue dev vs API), тестировать build локально. 4) MCP: документировать в QWEN.md, тестировать после добавления, credentials в env variables, проверять PostgreSQL connection. 5) CSS/Caching: hard refresh после CSS изменений (Ctrl+Shift+R), проверять HMR для Vite, точно сверять цвета (#666945), использовать browser dev tools для отладки. 6) GitHub sync: после значительных изменений коммитить в qwen-memory репозиторий.
