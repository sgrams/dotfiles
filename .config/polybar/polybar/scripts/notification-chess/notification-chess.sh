#!/bin/sh

username=""
games=$(curl -sf "https://api.chess.com/pub/player/$username/games/to-move" | jq ".[] | length")

if [ "$games" -gt 0 ]; then
   echo "#1 $games"
else
   echo "#2"
fi
