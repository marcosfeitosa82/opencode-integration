# Habblaud + OpenCode — Integração Oficial

![OpenHabblaud.jpg](docs/OpenHabblaud.jpg)

> Escritório virtual que mostra, em tempo real, o que os agentes do OpenCode estão fazendo — sem precisar do Claude Code (`claude`).

## O que faz
- Observa a API local do OpenCode (`service.json` v2.2.4) via `HABBLAUD_OPENCODE=1`
- Ativa permissões pelo escritório (`hooks:install`) e captura de uso (`usage:install`)
- Adaptador de mensagens (`plugin-adapter/`) para interação direta com agentes/subagentes
- Funciona no navegador (`http://localhost:4747`) com a imagem oficial

## Instalação rápida (sem `claude`)

```bash
bash install-opencode.sh
``` 

O script cria backup de `settings.json`, instala usage + hooks e ativa o observador.

## Uso

```bash
HABBLAUD_OPENCODE=1 npm start
```

Depois abra `http://localhost:4747`.

## Componentes da integração

| Componente | Caminho | Status |
|---|---|---|
| Plugin adaptado (mensagens/permissões) | `mod/habblaud-mensagens-opencode/` | Criado |
| Script de instalação | `install-opencode.sh` | Executável, com backup automático |
| Documentação + imagem | `README.md`, `docs/OpenHabblaud.jpg` | Atualizada |
| Configuração `.env` | `/root/habblaud/.env` | `HABBLAUD_OPENCODE=1` + senha |

## Imagem oficial

![OpenHabblaud.jpg](docs/OpenHabblaud.jpg)

## Rollback (sem perda)

```bash
npm run hooks:uninstall
npm run usage:uninstall
```

Backups criados automaticamente pelo script (`settings.json.habblaud-backup-*`).
