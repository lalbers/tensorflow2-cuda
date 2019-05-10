# tensorflow2-cuda
**Tensorflow 2 with Cuda (Docker Build)**

Workaround to handle CUDA 10.1 incompatibility


**Requirements (Arch):**
- Install latest nvidia graphics drivers on host: pacman -S nvidia
- Install nvidia-docker from aur: yay -S nvidia-docker


**Usage:**

docker run -d -P -p 8022:22 --runtime=nvidia twodarkmessiah/tensorflow2-cuda

*default ssh password: 'changeme'*


>ssh root@127.0.0.1 -p 8022

>python3 

>python~ import tensorflow

>python~ print("hello tensorflow")



Output should be:
```
Created TensorFlow device (/job:localhost/replica:0/task:0/device:GPU:0 with 9359 MB memory) -> physical GPU (device: 0, name: GeForce GTX 1080 Ti, pci bus id: 0000:01:00.0, compute capability: 6.1)
```

**For Development**

Configure Remote Python Interpreter to 127.0.0.1:8022.


This Docker Container is made to offer a workaround, to nvidia cuda problems with tensorflow2.
```
Failed to load the native TensorFlow runtime
ImportError: /usr/lib/libcusolver.so.10.0: version `libcusolver.so.10.0' not found 
```
