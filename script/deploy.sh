#!/usr/bin/env bash

cd /home/ubuntu/front

cp -r /home/ubuntu/front/.output  /home/ubuntu/deploy/front/.output

PID=$(pgrep -f ".output/server/index.mjs")
echo $PID

if [ -z "$PID" ]; then
  echo ">>> 프로세스가 없습니다."
else
  echo ">>> 프로세스가 존재합니다."
  echo ">>> 프로세스를 종료합니다."
  kill -9 $PID
fi

nohup node /home/ubuntu/deploy/front/.output/server/index.mjs > /dev/null 2>&1 &