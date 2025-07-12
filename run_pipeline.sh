
INPUT_VIDEO="data/traffic.mp4"
DETECTION_MODEL="models/person-vehicle-bike-detection-2004.xml"
CLASSIFICATION_MODEL="models/vehicle-attributes-recognition-barrier-0039.xml"

gst-launch-1.0 \
  filesrc location=$INPUT_VIDEO ! \
  decodebin ! \
  videoconvert ! \
  gvadetect \
    model=$DETECTION_MODEL \
    device=CPU \
    inference-interval=2 ! \
  queue ! \
  gvaclassify \
    model=$CLASSIFICATION_MODEL \
    device=CPU ! \
  queue ! \
  gvawatermark ! \
  videoconvert ! \
  fpsdisplaysink video-sink=autovideosink sync=fals