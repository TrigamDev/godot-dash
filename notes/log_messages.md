# Key Notes
- Have meaningful logs, don't log things just to log them
- Make sure anything important *is* logged
- Be specific, logs aren't helpful if they don't communicate all needed information
- Use technical terms in favor of simplifying it, logs are primarily going to be used by developers
  - Though, don't go *out* of your way to use technical terms when unnecessary
- Include exact measurements when applicable
  - Example: "loading took 5 seconds" rather than "loading was slow"
- Use past tense for completed actions, future tends for actions that have yet to be done, and present tense for actions currently underway
- Break complex events down into simple sequences
  - Example: "Player inventory overflowed during loot collection"



# Log Levels

## Info
- Significant events or information
- State changes

## Warning
- Abnormal situations or events
- Might indicate future problems, but don't have to

## Error
- Unrecoverable errors, may lead to a crash

## Debug
- Mostly just debugging information
- More or less useless to the player



# Message Structure
- Start with the subject or component being affected
- Describe the current state, action, or error
- Describe the outcome, impact, or other relevant details
- If applicable, describe possible solutions or courses of action

## Patterns
1. State Change
  - `<current_state> → <new_state>: <reason>`
  > MENU → LEVEL: Player pressed the play button

2. Warning/Recoverable Error
  - `<error>, take <action>`
  - `<error>, taking <action>...`
  - `<error>, took <action>`

3. Error
  - `<error>`
  - `<source> caused <effect>`