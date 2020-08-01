https://www.losant.com/blog/how-to-access-the-raspberry-pi-camera-in-docker
```
# permissions
cat /lib/udev/rules.d/10-local-rpi.rules
# change camera permissions
sudo tee /etc/udev/rules.d/99-camera.rules <<EOF
SUBSYSTEM=="vchiq",MODE="0666"
EOF
```

# docker 
--device /dev/vchiq
-v /opt/vc:/opt/vc
--env LD_LIBRARY_PATH=/opt/vc/lib

cd camera
make
docker run -it -v /opt/vc:/opt/vc --device /dev/vchiq --env LD_LIBRARY_PATH=/opt/vc/lib camera

/opt/vc/bin/raspistill -o output.jpg