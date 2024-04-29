#!/usr/bin/env bash

# for each *.AVI in PWD:
# vlc -I dummy ${INPUT_FILE}.AVI --sout="#transcode{acodec=mp3,ab=128,channels=2,samplerate=44100,scodec=none}:std{access=file{no-overwrite},mux=mp4,dst='${OUTPUT_FILE}.mp4'} vlc://quit

COUNT=0

mkdir -p output

for avi_file in *.AVI; do
    FILENAME=${avi_file%%.*}
    echo $FILENAME
    vlc -I dummy ${FILENAME}.AVI --sout="#transcode{acodec=mp3,ab=128,channels=2,samplerate=44100,scodec=none}:std{access=file{no-overwrite},mux=mp4,dst='output/${FILENAME}.mp4'}" vlc://quit
    let COUNT++
done

echo Fixed ${COUNT} files.
echo Done.
