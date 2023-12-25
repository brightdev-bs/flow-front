#!/usr/bin/env bash

cd /home/ubuntu/front

TIMESTAMP=`date +%Y%m%d`

echo ">>> Front Restart - $(date +%Y-%m-%d\ %H\:%M\:%S) <<<" >> "/home/ubuntu/deploy/log/$TIMESTAMP.log"

echo ">>> pid확인" >> "/home/ubuntu/deploy/log/$TIMESTAMP.log"
PID=$(pgrep -f ".output/server/index.mjs")

if [ -z "$PID" ]; then
  echo ">>> 프로세스가 없습니다." >> "/home/ubuntu/deploy/log/$TIMESTAMP.log"
else
  echo ">>> 프로세스가 존재합니다." >> "/home/ubuntu/deploy/log/$TIMESTAMP.log"
  echo ">>> 프로세스를 종료합니다." >> "/home/ubuntu/deploy/log/$TIMESTAMP.log"
  kill -9 $PID
fi

nohup node /home/ubuntu/front/.output/server/index.mjs 1>> /home/deploy/log/$TIMESTAMP.log 2>&1 &