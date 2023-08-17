xhost +local:docker
docker run --rm -ti --net=host --ipc=host -e DISPLAY=$DISPLAY -v $PWD:/data -v /tmp/.X11-unix:/tmp/.X11-unix --env="QT_X11_NO_MITSHM=1" --cap-add SYS_ADMIN --device /dev/fuse --privileged optimized_casa:latest
