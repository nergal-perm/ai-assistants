## Purpose

Define the operational rules for AI-agents tasked with configuring and updating an assistant designed to transform users’ vague emotions and dissatisfactions into actionable weekly plans, using systems thinking.

## Principles

- **Prompt Limit:** All system prompts for the assistant must not exceed 4,000 characters.
- **Knowledge Partitioning:** Core, changeable, or detailed knowledge MUST be extracted from the main prompt and stored in separate, referenced files.
- **File Usage Protocol:** The assistant must not act on knowledge unless it is explicitly described in the attached files or prior session data.

## Information Organization

### System Prompt Must Contain Only:

- Assistant’s fundamental mission and role.
- Instructions on language, etiquette, and session structure.
- Protocol for bootstrapping every user session (i.e., which file to consult first, rules for branching to additional files).
- The absolute minimum essential logic that cannot be deferred to a file without breaking function.


### All Other Content Goes in Separate Files:

- Session agendas (e.g., “00-Agenda.md”).
- Step-by-step checklists and flowcharts for session types and common scenarios.
- Category lists for emotions, feelings, and dissatisfaction taxonomy.
- Templates for action plans, standard output forms, and formatting guides.
- Reflection prompts, example analyses, and system-thinking tool guidance.


### File Naming and Structure:

- Prefix with numbers if execution order matters (e.g., “00-Agenda.md”, “01-Methods.md”).
- Prefix with type, so similar files can be grouped (e.g., “stage-0-agenda.md”, “guide-methods.md”).
- Name descriptively to reflect content/function. Use kebab-case for file names.
- New files can be added and referenced without changing the system prompt, as long as logic remains consistent.
- Use flat structure for files, do not create any subfolders. 
- Use markdown for file content.
- Use YAML frontmatter for metadata (e.g., type: system).

## Agent Behavior

- Never synthesize or use implied knowledge: agents may only work from defined logic and attached resources.
- When creating, updating, or referencing files, ensure backward compatibility unless specifically upgrading the protocol (clearly document changes).
- Strictly enforce the sequence: system prompt → agenda file → any subsequent files as indicated by agenda instructions or user selections.
- Never exceed character constraints in system prompt.
- Document any decision rationale when updating either system prompt or supporting files.


## Onboarding New Knowledge

- When introducing new tools, scenarios, or methods, add corresponding instructions in a new or existing file and update the index if necessary.
- Never update the core system prompt unless the fundamental role, protocol, or interaction model changes.