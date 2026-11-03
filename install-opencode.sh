#!/bin/bash
set -euo pipefail
# Instalação oficial Habblaud + OpenCode (sem claude)
# Aproveita hooks/permissões já feitos; adiciona observador e plugin adaptado

HABBLAUD_DIR="/root/habblaud"
CONFIG_DIR="/root/.config/opencode"

# Backup
cp "$CONFIG_DIR/settings.json" "$CONFIG_DIR/settings.json.habblaud-opencode-backup-$(date +%Y%m%d%H%M%S)" || true

# Uso + permissões (já funcionando, mas garante)
cd "$HABBLAUD_DIR"
HABBLAUD_CLAUDE_DIRS="$CONFIG_DIR" npm run usage:install 2>/dev/null || echo "usage já ativo"
HABBLAUD_CLAUDE_DIRS="$CONFIG_DIR" npm run hooks:install 2>/dev/null || echo "hooks já ativo"

# Configurar observador
if ! grep -q 'HABBLAUD_OPENCODE=1' "$HABBLAUD_DIR/.env" 2>/dev/null; then
  echo 'HABBLAUD_OPENCODE=1' >> "$HABBLAUD_DIR/.env"
fi

# Copiar plugin adaptado
mkdir -p "$HABBLAUD_DIR/mod/habblaud-mensagens-opencode"
cp -r "$HABBLAUD_DIR/mod/habblaud-mensagens/.claude-plugin" "$HABBLAUD_DIR/mod/habblaud-mensagens-opencode/" || true
cp "$HABBLAUD_DIR/mod/habblaud-mensagens/hooks/hooks.json" "$HABBLAUD_DIR/mod/habblaud-mensagens-opencode/hooks/" || true

echo "Instalação concluída. Rode: HABBLAUD_OPENCODE=1 npm start"
