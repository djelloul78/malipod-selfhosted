FROM python:3.13-slim

WORKDIR /app

# Installation du gestionnaire de paquets de Malipod
RUN pip install uv

# Copie des fichiers de configuration
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-cache

# Copie du reste du code
COPY . .

EXPOSE 8000

CMD ["uv", "run", "python", "-m", "malipod"]
