FROM archlinux/base

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility

RUN pacman -Sy
RUN pacman -S nvidia wget python-setuptools python-pip openssh --noconfirm
RUN wget https://neweraweb.de/cuda-10.0.130-2-x86_64.pkg.tar.xz
RUN pacman -U --noconfirm cuda-10.0.130-2-x86_64.pkg.tar.xz
RUN mkdir /var/run/sshd
RUN echo 'root:changeme' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN pip3 install tensorflow-gpu==2.0.0-alpha0
RUN pacman -S --noconfirm cudnn
RUN ssh-keygen -A
#ENTRYPOINT ["/bin/bash"]
CMD ["/usr/sbin/sshd", "-D"]
EXPOSE 22
