# Strategy Session Workflow - Artifact Flow Analysis

**Analysis Date:** 2025-11-26  
**Workflow Location:** `/Users/eugene/Dev/ai-assistants/strategist/agy-workflows/`

## Summary of Findings

✅ **Good News:** Most required artifacts are properly created during the stages.

⚠️ **Gaps Identified:**

1. **`структура_хранилища`** - expected in Stage 0 but created there, not supplied by user initially
2. **`данные_цифрового_двойника`** - expected in Stage 2 but never explicitly created
3. **`критерии_выбора`** - expected in Stage 3 but may be referenced from external document
4. **`обязательства_календаря`** - expected in Stage 5 but not explicitly created in workflow

## Artifact Flow Table

| Artifact Name | Source Type | Created at Stage | Used at Stage(s) | Parameter Name | Notes |
|---------------|-------------|------------------|------------------|----------------|--------|
| **запрос_на_сессию** | `user_provided` | User input | Stage 0 | `запрос_на_сессию` | Initial user request to start session |
| **предыдущие_сессии** | `assistant_created` | Previous sessions | Stage 0, Main | `предыдущие_сессии` | Saved from previous sessions |
| **структура_хранилища** | `assistant_created` | Stage 0 (created & saved as KI) | Stage 0 | `структура_хранилища` | ⚠️ Created in first run, retrieved from KI in subsequent sessions |
| **доступные_файлы** | `user_provided` | User input | Main workflow | `доступные_файлы` | Optional user-provided files |
| **дневниковые_записи** | `vault_sourced` | Vault | Stage 1 | `дневниковые_записи` | Required for NEP table creation - diary entries from vault |
| **предыдущая_таблица_нэп** | `assistant_created` | Previous session | Stage 1 | `предыдущая_таблица_нэп` | Optional context from past sessions |
| **глобальная_цель** | `user_provided` + `assistant_created` | User/Stage 1-2 | Stage 1, 2, 3 | `глобальная_цель` | Collaboratively refined through stages 1-2 |
| **таблица_нэп** | `assistant_created` | Stage 1 | Stage 2, 3 | `таблица_нэп` | Key artifact: Dissatisfactions, Emotions, Problems table |
| **данные_цифрового_двойника** | `assistant_created` | ❌ Not created | Stage 2 | `данные_цифрового_двойника` | ⚠️ **GAP**: Role position, self-assessment scale - should be tracked by assistant |
| **карта_ограничений** | `assistant_created` | Stage 2 | Internal to Stage 2 | - | Includes what to keep stable and what to change |
| **тос_месяц** | `assistant_created` | Stage 2 | Stage 3, 4, 5 | `тос_месяц` | Core bottleneck identification with hypothesis |
| **существующие_проекты** | `vault_sourced` | Vault | Stage 3 | `существующие_проекты` | Optional existing project list from user's vault |
| **критерии_выбора** | `vault_sourced` | Stage 3 / External doc | Stage 3 | `критерии_выбора` | ⚠️ Referenced from "Практики саморазвития", may be created in Stage 3 |
| **список_проектов** | `assistant_created` | Stage 3 | Stage 4 | `список_проектов` | Priority projects list (max 5) with cards |
| **карточки_проектов** | `assistant_created` | Stage 3 | Stage 4 | Part of `список_проектов` | Detailed project cards with criteria |
| **предыдущий_контракт** | `assistant_created` | Previous session | Stage 4 | `предыдущий_контракт` | Optional from past period |
| **месячный_контракт** | `assistant_created` | Stage 4 | Stage 5 | `месячный_контракт` | Monthly contract with experiments and actions |
| **итоги_прошлой_недели** | `vault_sourced` | Vault | Stage 5 | `итоги_прошлой_недели` | ⚠️ Plan-fact report from previous week in vault |
| **обязательства_календаря** | `vault_sourced` | Vault | Stage 5 | `обязательства_календаря` | ⚠️ **GAP**: Calendar commitments from user's calendar |
| **недельный_план** | `assistant_created` | Stage 5 | Stage 6 | `недельный_план` | Weekly plan with TOC-week, work products, time budget |
| **резюме_сессии** | `assistant_created` | Stage 6 | End/Future sessions | - | Session summary and action list |

## Detailed Gap Analysis

### 🔴 Critical Gaps (Required but not created)

#### 1. `данные_цифрового_двойника` (Stage 2)

- **Expected**: Role position on trajectory (Ученик → Интеллектуал → Профессионал → Исследователь), self-assessment scale (1-6)
- **Status**: ❌ Not explicitly created in any stage
- **Impact**: Stage 2 uses this for bottleneck analysis but must rely on user providing it ad-hoc
- **Recommendation**: Should be created/updated in Stage 1 or Stage 2

#### 2. `обязательства_календаря` (Stage 5)

- **Expected**: Scheduled meetings and events for the week
- **Status**: ❌ Not created in workflow
- **Impact**: Weekly planning may miss important constraints
- **Recommendation**: Should be requested from user in Stage 5 or integrated from calendar system

### 🟡 Moderate Gaps (Optional or ambiguous)

#### 3. `критерии_выбора` (Stage 3)

- **Expected**: Criteria for selecting priority projects
- **Status**: 🟡 Referenced from external document "Практики саморазвития"
- **Impact**: May be created during Stage 3 dialogue
- **Recommendation**: Clarify whether this is created in Stage 3 or pre-exists

#### 4. `итоги_прошлой_недели` (Stage 5)

- **Expected**: Plan-fact for artifacts, time, state from previous week
- **Status**: 🟡 Expected from user or previous session
- **Impact**: Useful for adjusting planning
- **Recommendation**: Should be formalized as output of previous week's execution

### ✅ Properly Handled

#### 5. `структура_хранилища` (Stage 0)

- **Status**: ✅ Created in first session and saved as Knowledge Item
- **Flow**: Created → Saved to KI → Retrieved in future sessions

## Recommendations

1. **Add Stage 1.5 or extend Stage 1**: Create/update `данные_цифрового_двойника` with role position and self-assessment
2. **Stage 5 input**: Explicitly request `обязательства_календаря` from user
3. **Clarify Stage 3**: Document whether `критерии_выбора` are created or retrieved from external source
4. **Formalize weekly reporting**: Create standard template for `итоги_прошлой_недели` as output of Stage 6 or daily execution

## Artifact Dependencies by Stage

### Stage 0: Определение повестки сессии

**Inputs:**

- `запрос_на_сессию` (required, from user)
- `предыдущие_сессии` (optional, from previous sessions)
- `структура_хранилища` (optional, from Knowledge Item or created)

**Outputs:**

- `структура_хранилища` (saved to Knowledge Item)
- Agenda decision (short vs. full session)

### Stage 1: Определение неудовлетворенностей, эмоций, проблем

**Inputs:**

- `дневниковые_записи` (required, from user)
- `предыдущая_таблица_нэп` (optional, from previous session)
- `глобальная_цель` (optional, from user or refined here)

**Outputs:**

- `таблица_нэп` (max 5 rows)
- `глобальная_цель` (refined)

### Stage 2: Диагностика узкого места

**Inputs:**

- `таблица_нэп` (required, from Stage 1)
- `глобальная_цель` (optional, from Stage 1)
- `данные_цифрового_двойника` (optional, ⚠️ gap)

**Outputs:**

- `тос_месяц` (bottleneck card with hypothesis)
- `карта_ограничений`
- Self-assessment update (1-6 scale)

### Stage 3: Выявление приоритетных проектов

**Inputs:**

- `тос_месяц` (required, from Stage 2)
- `глобальная_цель` (required, from Stage 1-2)
- `таблица_нэп` (required, from Stage 1)
- `существующие_проекты` (optional, from user)
- `критерии_выбора` (optional, ⚠️ may be external)

**Outputs:**

- `список_проектов` (max 5 projects)
- `карточки_проектов` (detailed cards)
- `критерии_выбора` (if created)

### Stage 4: Составление месячного контракта

**Inputs:**

- `тос_месяц` (required, from Stage 2)
- `список_проектов` (required, from Stage 3)
- `предыдущий_контракт` (optional, from previous period)

**Outputs:**

- `месячный_контракт` (with time budget, metrics, reading list)

### Stage 5: Недельное планирование

**Inputs:**

- `месячный_контракт` (required, from Stage 4)
- `итоги_прошлой_недели` (optional, ⚠️ external)
- `обязательства_календаря` (optional, ⚠️ gap)

**Outputs:**

- `недельный_план` (TOC-week, work products, time budget, stop-list)

### Stage 6: Установки на дневное исполнение

**Inputs:**

- `недельный_план` (required, from Stage 5)

**Outputs:**

- `резюме_сессии`
- Recommendations for daily execution
- Slot discipline guidance

## Workflow Variants

### Short Agenda (Stages 1, 5, 6)

**Required artifacts:**

- Stage 1: `дневниковые_записи` → produces `таблица_нэп`
- Stage 5: `месячный_контракт` (must be provided or exist from previous long session)
- Stage 6: `недельный_план` → produces `резюме_сессии`

**Note**: Short agenda assumes `месячный_контракт` already exists from a previous full session.

### Full Agenda (Stages 1-6)

All artifacts flow sequentially through all stages as described above.
