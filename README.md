# brave-container
podman run -it --rm \
    --volume /tmp/.X11-unix:/tmp/.X11-unix \
    --volume /dev/shm:/dev/shm \
    --volume /etc/machine-id:/etc/machine-id \
    --volume /run/user/1000:/run/user/1000 \
    --volume /run/dbus:/run/dbus \
    --volume /var/lib/dbus:/var/lib/dbus \
    --volume ${HOME}/.brave:/data \
    --env DISPLAY=unix${DISPLAY} \
    --device /dev/dri \
    --device /dev/snd \
    --group-add $(getent group audio | cut -d: -f3) \
    --group-add $(getent group video | cut -d: -f3) \
    --ipc host \
    --security-opt seccomp=unconfined \
    --security-opt apparmor=unconfined \
    brave

