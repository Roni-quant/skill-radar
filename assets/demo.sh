#!/usr/bin/env bash
# Simulated transcript for skill-radar README demo. Runs inside vhs.
set -u

RED='\033[1;31m'
YEL='\033[1;33m'
GRN='\033[1;32m'
WHT='\033[1;37m'
DIM='\033[2;37m'
OFF='\033[0m'

say() { printf "%b\n" "$1"; sleep "$2"; }

clear

say "${YEL}─── using-superpowers ───${OFF}" 0.4
say "" 0.1
say "${WHT}> Add a print statement before line 30 in app.py to log user_id.${OFF}" 0.8
say "" 0.2
say "${DIM}  Using brainstorming...${OFF}" 0.45
say "${DIM}  Using writing-plans...${OFF}" 0.45
say "${DIM}  Using test-driven-development...${OFF}" 0.45
say "${DIM}  Using verification-before-completion...${OFF}" 0.45
say "" 0.2
say "${RED}  [ 4 skills loaded · 0 lines edited ]${OFF}" 1.0
say "" 0.4

say "${GRN}─── skill-radar ───${OFF}" 0.4
say "" 0.1
say "${WHT}> Add a print statement before line 30 in app.py to log user_id.${OFF}" 0.8
say "" 0.2
say "${WHT}  app.py${OFF}" 0.3
say "${WHT}  @@ -28,6 +28,7 @@${OFF}" 0.3
say "${WHT}      def handle(req):${OFF}" 0.2
say "${WHT}          user = req.user${OFF}" 0.2
say "${GRN}  +       print(f\"[debug] user_id={user.id}\")${OFF}" 0.6
say "${WHT}          return process(user)${OFF}" 0.4
say "" 0.2
say "${GRN}  [ 0 skills loaded · 1 line edited ]${OFF}" 1.5
