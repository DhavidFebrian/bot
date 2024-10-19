#!/bin/bash

# Associative array of directories and their corresponding commands
declare -A bots=(
    ["agent301"]="python bot.py"
    ["birds"]="python bot.py"
    ["bump"]="python bot.py"
    ["blum"]="npm start"
    ["blum1"]="npm start"
    ["blum2"]="npm start"
    ["cyberf"]="python bot.py"
    ["depinberg"]="python main.py"
    ["fastmint"]="python bot.py"
    ["fintopio"]="python Fintopio.py"
    ["firecoin"]="python app.py"
    ["freedog"]="node main.js"
    ["goats"]="python main.py"
    ["major"]="python bot.py"
    ["matchq"]="python bot.py"
    ["memefi"]="python main.py"
    ["tonxdao"]="python bot.py"
    ["pinktrade"]="python bot.py"
    ["pocketfi"]="python bot.py"
    ["snapster"]="python main.py"
    ["tabizoo"]="python bot.py"
    ["tomarket"]="python app.py"
    ["tomarket1"]="python app.py"
    ["tomarket2"]="python app.py"
    ["nanonfish"]="python ikan.py"
    ["yescoin"]="python yescoin.py"
)

# Maximum number of panes per window
MAX_PANES_PER_WINDOW=13
current_pane_count=0
window_count=1

# Start a new tmux session with the first bot
first_bot=$(echo "${!bots[@]}" | awk '{print $1}')
tmux new-session -d -s bots -n "window_$window_count" "cd ~/bot/$first_bot && ${bots[$first_bot]}"

# Loop through the remaining bots
for bot in "${!bots[@]}"; do
  if [ "$bot" != "$first_bot" ]; then
    cmd=${bots[$bot]}

    # Check if the current pane count exceeds the maximum
    if [ $current_pane_count -ge $MAX_PANES_PER_WINDOW ]; then
      # Create a new window if the pane limit is reached
      window_count=$((window_count + 1))
      tmux new-window -t bots: -n "window_$window_count"
      current_pane_count=0
    fi

    # Open a new tmux pane for each bot
    tmux split-window -t bots: -h "cd ~/bot/$bot && $cmd"
    tmux select-layout tiled  # Organize panes in a tiled layout
    current_pane_count=$((current_pane_count + 1))
  fi
done

# Attach to the tmux session
tmux attach-session -t bots
