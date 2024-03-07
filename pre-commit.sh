#!/bin/bash

# Obtém o diff das alterações
git_diff=$(git diff --cached)

# URL do webhook do Teams
teams_webhook_url="https://db1global.webhook.office.com/webhookb2/b1bc2760-4beb-4477-bcf8-5985ee88e1e9@ea47001a-3428-40f3-8ea1-86bdb1a3bc84/IncomingWebhook/95db0bf07937451a907248636ae1106c/491cd312-935b-4b9c-aeb9-5b827f17ede0"

# Verifica se há alterações para commit
if [ -n "$git_diff" ]; then
    # Formata a mensagem
    message_payload="{\"text\":\"Alterações no código:\n\`\`\`\n$git_diff\n\`\`\`\"}"

    # Envia a mensagem para o Teams
    curl -H "Content-Type: application/json" -d "$message_payload" -X POST "$teams_webhook_url"
fi

# Continua com o processo de commit normalmente
exit 0