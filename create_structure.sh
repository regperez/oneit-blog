# Crear la estructura para 'app' y sus subdirectorios/archivos
mkdir -p oneit-blog/app/{templates,static}
touch oneit-blog/app/app.py
touch oneit-blog/app/requirements.txt

# Crear archivos en la raíz
touch oneit-blog/Dockerfile
touch oneit-blog/docker-compose.yml

# Crear la estructura para 'terraform' y sus archivos
mkdir oneit-blog/terraform
touch oneit-blog/terraform/main.tf
touch oneit-blog/terraform/variables.tf
touch oneit-blog/terraform/outputs.tf

# Crear la estructura para 'ansible' y sus archivos
mkdir oneit-blog/ansible
touch oneit-blog/ansible/playbook.yml
touch oneit-blog/ansible/inventory.ini

# Crear la estructura para '.github/workflows' y sus archivos
mkdir -p oneit-blog/.github/workflows
touch oneit-blog/.github/workflows/ci-build-push.yaml
touch oneit-blog/.github/workflows/deploy-remote.yaml
