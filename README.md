# tensorflow2-cuda
**Tensorflow 2 with Cuda (Docker Build)**

Workaround to handle CUDA 10.1 incompatibility



Requirements (Arch):

Install latest nvidia graphics drivers on host: pacman -S nvidia

Install nvidia-docker from aur: yay -S nvidia-docker



docker run -d -P -p 8022:22 --runtime=nvidia twodarkmessiah/tensorflow2-cuda

default ssh password: 'changeme'

How-To-Use
ssh root@127.0.0.1 -p 8022
python 
-> import tensorflow
-> print("hello tensorflow")


Output should be:

Created TensorFlow device (/job:localhost/replica:0/task:0/device:GPU:0 with 9359 MB memory) -> physical GPU (device: 0, name: GeForce GTX 1080 Ti, pci bus id: 0000:01:00.0, compute capability: 6.1)


For Development: Configure Remote Python Interpreter to 127.0.0.1:8022.
