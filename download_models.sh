#!/bin/bash
# Model downloader script

MODEL_DIR="models"
mkdir -p $MODEL_DIR

echo "Downloading detection model..."
wget https://download.01.org/opencv/2021/openvinotoolkit/2021.4/open_model_zoo/models_bin/1/person-vehicle-bike-detection-2004/FP32/person-vehicle-bike-detection-2004.xml -P $MODEL_DIR
wget https://download.01.org/opencv/2021/openvinotoolkit/2021.4/open_model_zoo/models_bin/1/person-vehicle-bike-detection-2004/FP32/person-vehicle-bike-detection-2004.bin -P $MODEL_DIR

echo "Downloading classification model..."
wget https://download.01.org/opencv/2021/openvinotoolkit/2021.4/open_model_zoo/models_bin/1/vehicle-attributes-recognition-barrier-0039/FP32/vehicle-attributes-recognition-barrier-0039.xml -P $MODEL_DIR
wget https://download.01.org/opencv/2021/openvinotoolkit/2021.4/open_model_zoo/models_bin/1/vehicle-attributes-recognition-barrier-0039/FP32/vehicle-attributes-recognition-barrier-0039.bin -P $MODEL_DIR

echo "Models downloaded to $MODEL_DIR"