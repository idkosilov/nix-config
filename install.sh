#!/usr/bin/env bash
set -euo pipefail

# Вычисляем текущее имя пользователя
USERNAME=$(whoami)

echo "Welcome to the macOS Nix configuration setup for user: $USERNAME!"

read -p "Enter your Git username: " GITNAME
read -p "Enter your Git email: " GITEMAIL

HOST=$(hostname | sed 's/\.local$//')

cat > config.nix <<EOF
{
  user = "$USERNAME";
  host = "$HOST";

  git = {
    userName = "$GITNAME";
    userEmail = "$GITEMAIL";
  };
}
EOF

echo "config.nix generated successfully!"
echo "Generated config.nix content:"
cat config.nix

echo "Building Darwin configuration..."
nix build .#darwinConfigurations."$HOST".system

echo "Switching Darwin configuration..."
darwin-rebuild switch --flake .

echo "Applying Home Manager configuration..."
nix run .#homeConfigurations."$USERNAME".activationPackage

echo "Environment successfully deployed!"