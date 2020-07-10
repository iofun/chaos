title:  How To Install TorchCraft and Set Up a Programming Environment on Linux
date: 2020-07-09
description: TorchCraft is a BWAPI module that sends StarCraft data out over a ZMQ connection. This lets you parse game data and interact with BWAPI. 

{% img [class name(s)] /images/python.jpg %}

Python is an interpreted, high-level, general-purpose programming language with strengths in automation, data analysis and machine learning.

This tutorial will walk you through installing Python 3 and setting up a programming environment on Debian 10.

## Step 1 - Update and Upgrade

Logged into your system as root, first update and upgrade to ensure your shipped version of Python 3 is up-to-date.

```
apt update
```

```
apt upgrade
```

Confirm upgrade when prompted to do so.


## Step 2 - Check Version of Python

Check your version of Python 3 installed by typing:

```
python3 --version
```

You'll receive output similar to the following.

```
Python 3.7.3
```

## Step 3 - Install pip

To manage software packages for Python, install `pip`, the standard package installer for Python. You can use pip to install things from the official package index and other indexes. 

```
apt install -y python3-pip
```

Python packages can be installed by typing:

```
pip3 install schematics 
```

Here, schematics can refer to any Python package or library, such as tornado for backend development or NumPy for scientific computing. 

## Step 4 - Install Additional Tools
There are a few more packages and development tools to install to ensure that we have a robust set-up for our StarCraft: Brood War bots programming environment:

```
apt -y install --install-recommends git apt-transport-https\
 gnupg2 wget software-properties-common curl build-essential\
 gfortran pkg-config make cmake libyaml-0-2 libyaml-dev vim
```

```
dpkg --add-architecture i386
```

```
wget -nc https://dl.winehq.org/wine-builds/winehq.key && apt-key add winehq.key
```

```
apt-add-repository 'deb https://dl.winehq.org/wine-builds/debian/ buster main'
```

```
apt update && rm winehq.key
```

```
apt -y install --install-recommends libgnutls30:i386 libldap-2.4-2:i386\
 libgpg-error0:i386 libxml2:i386 libasound2-plugins:i386 libsdl2-2.0-0:i386\
 libfreetype6:i386 libdbus-1-3:i386 libsqlite3-0:i386 libgl1-mesa-glx:i386\
 libgl1-mesa-dri:i386 mesa-vulkan-drivers
```

```
apt -y install --install-recommends winehq-staging winetricks
```

```
git clone https://github.com/spacebeam/starcraft-sif.git /usr/src/starcraft-sif
```
```
cat /usr/src/starcraft-sif/include/core/core* > /opt/StarCraft.tar.gz
```

```
tar -zxvf /opt/StarCraft.tar.gz -C /opt/
```


```
pip3 install torch
``` 

## Use WINE

## Running TorchCraft

`$ python python/example.py -t $server_ip`
