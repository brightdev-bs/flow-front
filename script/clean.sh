# beforeInstall.bash

#!/usr/bin/env bash
if [ -d /home/ubuntu/front ]; then
    sudo rm -rf /home/ubuntu/front
fi
sudo mkdir -vp /home/ubuntu/front