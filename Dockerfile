FROM python:3.9-slim

WORKDIR /app

# Install system dependencies (build tools, ffmpeg, etc.)
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    g++ \
    make \
    python3-dev \
    libffi-dev \
    libssl-dev \
    pkg-config \
    ffmpeg \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Copy code
COPY repo /app

# Upgrade pip and install requirements
RUN pip install --no-cache-dir -U pip setuptools wheel && \
    if [ -f "requirements.txt" ]; then pip install --no-cache-dir -r requirements.txt; fi

CMD ["bash", "start"]
