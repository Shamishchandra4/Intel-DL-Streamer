# DL Streamer Pipeline for Intel CPUs

## 📌 Overview
A scalable video analytics pipeline using **DL Streamer** (GStreamer + OpenVINO) to decode, detect, and classify objects on Intel CPUs. Benchmarked on **i5-11320H**.

## 🚀 Quick Start
```bash
# Setup (Ubuntu 22.04)
./scripts/install_deps.sh

# Run pipeline (CPU)
./scripts/run_pipeline.sh

# Benchmark scalability
./scripts/benchmark.sh
