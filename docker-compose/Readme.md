# Usando ${VARIABLE}

mv .env-example .env
docker-compose up -d --env-file .env

# Instalacao CERTBOT

sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo snap set certbot trust-plugin-with-root=ok

# Criando Certificados Wildcard

certbot certonly --manual --preferred-challenges=dns --email mail@gmail.com --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d example.com -d *.example.com

# Add TXT Record DNS

Successfully received certificate.
Certificate is saved at: /etc/letsencrypt/live/example.com/fullchain.pem
Key is saved at:         /etc/letsencrypt/live/example.com/privkey.pem

# (Optional) Overwrite Default Certificates

cp /etc/letsencrypt/live/example.com/fullchain.pem /etc/traefik/certs/cert.pem
cp /etc/letsencrypt/live/example.com/privkey.pem /etc/traefik/certs/cert-key.pem