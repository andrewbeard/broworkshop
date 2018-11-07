#!/bin/sh
docker run -it --mount type=bind,source=$(pwd),target=/root/workshop bearda/broworkshop
