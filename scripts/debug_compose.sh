#!/bin/bash
# Script para diagnosticar problemas con docker compose en la VM

set -e

echo "=== Debug Docker Compose ==="
echo ""

# 1. Verificar variables de entorno
echo "1. Checking environment variables..."
echo "POSTGRES_USER: ${POSTGRES_USER:-NOT SET}"
echo "POSTGRES_PASSWORD: ${POSTGRES_PASSWORD:-NOT SET}"
echo "POSTGRES_DB: ${POSTGRES_DB:-NOT SET}"
echo ""

# 2. Verificar archivos
echo "2. Checking files..."
ls -la docker-compose.yml .env 2>/dev/null || echo "Missing files"
echo ""

# 3. Verificar docker
echo "3. Checking docker..."
docker version || echo "Docker not working"
docker compose version || echo "Docker compose not available"
echo ""

# 4. Validar docker-compose.yml
echo "4. Validating docker-compose.yml..."
docker compose config > /tmp/compose-validated.yml 2>&1 && echo "✓ Valid" || (echo "✗ Invalid:"; cat /tmp/compose-validated.yml)
echo ""

# 5. Intentar up con verbose
echo "5. Attempting 'docker compose up' with verbose output..."
docker compose --verbose up -d 2>&1 | head -100
echo ""

# 6. Mostrar estado
echo "6. Current containers:"
docker compose ps || echo "No containers"
echo ""

# 7. Mostrar logs
echo "7. Recent logs:"
docker compose logs --tail=30 2>&1 || echo "No logs available"
echo ""

echo "=== End Debug ==="
