## ARMHF Debian with SSHD

Build image :

    docker build -t ebspace/armhf-debian-sshd:latest .


Start the image :

    docker run -d -p 22000:22 ebspace/armhf-debian-sshd


Test the image :

    ssh -p 22000 root@localhost

The root password is  `root`
    
