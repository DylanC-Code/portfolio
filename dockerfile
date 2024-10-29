# Utilisez l'image de base Node.js avec TypeScript
FROM mcr.microsoft.com/devcontainers/typescript-node:1-22-bookworm

# Installez des outils communs et Terraform (ajout manuel des fonctionnalités)
RUN apt-get update && \
    apt-get install -y \
    curl \
    unzip \
    gnupg && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list && \
    apt-get update && \
    apt-get install -y terraform && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Exposez les ports pour le développement
EXPOSE 5173 4173

# Installez pnpm (si nécessaire) et ajoutez un alias pour Terraform
RUN npm install -g pnpm && \
    echo "alias t='terraform'" >> /etc/bash.bashrc

# Copiez et exécutez un script de configuration Git si nécessaire
COPY gitconfig.sh /root/
RUN chmod +x /root/gitconfig.sh && /root/gitconfig.sh

WORKDIR /app

COPY package.json /app

# Définit l'utilisateur root comme utilisateur par défaut
USER root

# Commande de post-création
RUN pnpm install

CMD ["sleep", "infinity"]
