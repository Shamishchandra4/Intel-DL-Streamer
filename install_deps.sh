
```bash


echo "Installing system dependencies..."
sudo apt-get update
sudo apt-get install -y \
    docker.io \
    intel-openvino-runtime-ubuntu22-2023.1.0 \
    intel-dlstreamer

echo "Setting up Docker..."
sudo usermod -aG docker $USER
newgrp docker

echo "Pulling DL Streamer image..."
docker pull intel/dlstreamer:latest

echo "Installation complete!"