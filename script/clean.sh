# beforeInstall.bash

#!/usr/bin/env bash
if [ -d /usr/ubuntu/front ]; then
    sudo rm -rf /usr/ubuntu/front
fi
sudo mkdir -vp /usr/ubuntu/front