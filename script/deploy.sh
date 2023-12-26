#!/usr/bin/env bash
rm -rf /home/ubuntu/deploy/front
cp -rf /home/ubuntu/front  /home/ubuntu/deploy/front/

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