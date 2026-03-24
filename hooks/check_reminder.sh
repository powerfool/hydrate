#!/usr/bin/env bash
# Outputs a reminder to Claude's context if 45 minutes have elapsed.
# Claude will incorporate it naturally into its next response.

TIMESTAMP_FILE="$HOME/.hydrate_last_reminder"
COUNTER_FILE="$HOME/.hydrate_counter"
INTERVAL=2700  # 45 minutes

now=$(date +%s)
last=$(cat "$TIMESTAMP_FILE" 2>/dev/null || echo 0)
elapsed=$(( now - last ))

if [ "$elapsed" -ge "$INTERVAL" ]; then
  echo "$now" > "$TIMESTAMP_FILE"

  count=$(cat "$COUNTER_FILE" 2>/dev/null || echo 0)
  echo $(( (count + 1) % 2 )) > "$COUNTER_FILE"

  if [ "$count" -eq 0 ]; then
    cat <<'EOF'
<hydrate-reminder>
Before answering, open your response with the following inside a fenced code block (```), followed by a single friendly line:


__   _ __   __ ____  ____      _  _____ _____
| | | |\ \ / /|  _ \|  _ \    / \|_   _| ____|
| |_| | \ V / | | | | |_) |  / _ \ | | |  _|
|  _  |  | |  | |_| |  _ <  / ___ \| | | |___
|_| |_|  |_|  |____/|_| \_\/_/   \_\_| |_____|

                  ~ ~ ~  sip sip sip  ~ ~ ~


Then answer the user's question as normal.
</hydrate-reminder>
EOF
  else
    cat <<'EOF'
<hydrate-reminder>
Before answering, open your response with the following inside a fenced code block (```), followed by a single friendly line:


_______ _____  _    _   _ ____     _   _ ____
  / ___|_   _|/ \  | \ | |  _ \   | | | |  _ \
  \___ \ | | / _ \ |  \| | | | |  | | | | |_) |
   ___) || |/ ___ \| |\  | |_| |  | |_| |  __/
  |____/ |_/_/   \_\_| \_|____/    \___/|_|

            \o/   get up & stretch!
             |
            / \


Then answer the user's question as normal.
</hydrate-reminder>
EOF
  fi
fi
