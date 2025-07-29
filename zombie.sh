
#!/data/data/com.termux/files/usr/bin/bash

# Simple ASCII zombie survival game (bash version)
# Controls: w = up, s = down, a = left, d = right, f = throw, q = quit

# Game map size
W=20
H=10

# Player
px=10
py=5
health=100
dustbins=5
rescue=90

# Arrays to store zombies and projectiles
declare -A zombies
declare -A projectiles

function clear_screen {
  clear
  echo "Health: $health  Dustbins: $dustbins  Rescue in: $rescue"
  echo "Move: [WASD] | Throw: F | Quit: Q"
}

function draw_map {
  for ((y=1; y<=H; y++)); do
    row=""
    for ((x=1; x<=W; x++)); do
      cell=" "
      [[ $x -eq $px && $y -eq $py ]] && cell="B"
      [[ "${zombies[$x,$y]}" == "1" ]] && cell="Z"
      [[ "${projectiles[$x,$y]}" == "1" ]] && cell="*"
      row="$row$cell"
    done
    echo "$row"
  done
}

function move_zombies {
  local new_zombies=()
  for key in "${!zombies[@]}"; do
    IFS=',' read zx zy <<< "$key"
    [[ -z "$zx" || -z "$zy" ]] && continue
    [[ "$zx" -lt "$px" ]] && ((zx++))
    [[ "$zx" -gt "$px" ]] && ((zx--))
    [[ "$zy" -lt "$py" ]] && ((zy++))
    [[ "$zy" -gt "$py" ]] && ((zy--))
    if [[ $zx -eq $px && $zy -eq $py ]]; then
      ((health-=10))
    else
      zombies[$zx,$zy]=1
    fi
    unset zombies[$key]
  done
}

function move_projectiles {
  local new_projectiles=()
  for key in "${!projectiles[@]}"; do
    IFS=',' read dx dy <<< "$key"
    ((dx+=proj_dx))
    ((dy+=proj_dy))
    if [[ "$dx" -lt 1 || "$dx" -gt "$W" || "$dy" -lt 1 || "$dy" -gt "$H" ]]; then
      unset projectiles[$key]
      continue
    fi
    if [[ "${zombies[$dx,$dy]}" == "1" ]]; then
      unset zombies[$dx,$dy]
      unset projectiles[$key]
      ((dustbins++))
    else
      projectiles[$dx,$dy]=1
    fi
    unset projectiles[$key]
  done
}

function throw_dustbin {
  if [[ $dustbins -le 0 ]]; then return; fi
  ((dustbins--))
  projectiles[$px,$py]=1
}

function spawn_zombie {
  edge=$((RANDOM % 4))
  case $edge in
    0) x=1; y=$((RANDOM % H + 1));;
    1) x=$W; y=$((RANDOM % H + 1));;
    2) x=$((RANDOM % W + 1)); y=1;;
    3) x=$((RANDOM % W + 1)); y=$H;;
  esac
  zombies[$x,$y]=1
}

# Game loop
while true; do
  clear_screen
  draw_map
  if [[ $health -le 0 ]]; then echo "You died!"; break; fi
  if [[ $rescue -le 0 ]]; then echo "You survived!"; break; fi
  read -n1 -p "> " input
  echo ""
  case $input in
    w) ((py>1)) && ((py--));;
    s) ((py<H)) && ((py++));;
    a) ((px>1)) && ((px--));;
    d) ((px<W)) && ((px++));;
    f) proj_dx=0; proj_dy=0
       case $last in
         w) proj_dy=-1;;
         s) proj_dy=1;;
         a) proj_dx=-1;;
         d) proj_dx=1;;
       esac
       throw_dustbin;;
    q) echo "Quit game."; break;;
  esac
  last=$input
  move_projectiles
  move_zombies
  ((rescue--))
  (( RANDOM % 3 == 0 )) && spawn_zombie
done
