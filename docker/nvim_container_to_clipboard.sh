set -euo pipefail

if [[ $# > 2 ]]; then
    printf "%s\n" "[ERROR] $# arguments given. Expected 2 or less => register, service" >&2
    exit 1
fi

REGISTER="\""
if [[ $# -ge 1 ]]; then
    REGISTER=$1
fi

CONTAINER=""
if [[ $# -ge 2 ]]; then
    CONTAINER="docker-$2-1"
else
    CONTAINER=$(docker ps --filter "label=neovim" --format "{{.ID}}")
fi

docker exec -t $CONTAINER nvim --headless -c "echo @$REGISTER" -c "q" | xclip
docker exec -t $CONTAINER nvim --headless -c "echo @$REGISTER" -c "q" | xclip -selection clipboard
echo "[SUCCESS] Copied from container $CONTAINER (register $REGISTER)"
