#!/bin/bash
# Scalability benchmark script

LOG_DIR="results"
mkdir -p $LOG_DIR

for streams in 1 2 4 8; do
  echo "Testing $streams streams..."
  
  # Start pipelines
  for ((i=0; i<$streams; i++)); do
    GST_DEBUG=2 ./scripts/run_pipeline.sh > "$LOG_DIR/stream_${streams}_$i.log" 2>&1 &
  done

  # Monitor for 30 seconds
  sleep 30
  
  # Calculate average FPS
  fps_sum=0
  for log in "$LOG_DIR/stream_${streams}_"*.log; do
    fps=$(grep "fps" $log | awk '{print $1}' | tail -1)
    fps_sum=$(echo "$fps_sum + $fps" | bc)
  done
  
  avg_fps=$(echo "scale=2; $fps_sum / $streams" | bc)
  echo "$streams,$avg_fps" >> "$LOG_DIR/cpu_benchmarks.csv"
  
  # Cleanup
  pkill gst-launch
  sleep 2
done