#!/usr/bin/env bash

cd /home/ubuntu/front

PID=$(pgrep -f ".output/server/index.mjs")
echo $PID

if [ -z "$PID" ]; then
  echo ">>> 프로세스가 없습니다."
else
  echo ">>> 프로세스가 존재합니다."
  echo ">>> 프로세스를 종료합니다."
  kill -9 $PID
fi

nohup node /home/ubuntu/front/.output/server/index.mjs 1>> /home/deploy/log/$TIMESTAMP.log 2>&1 &