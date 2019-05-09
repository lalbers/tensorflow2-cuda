FROM archlinux/base
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
RUN pacman -Sy
RUN pacman -S nvidia wget python-setuptools python-pip openssh sudo --noconfirm
RUN useradd user 
RUN echo 'user:changeme' | chpasswd
RUN wget https://neweraweb.de/cuda-10.0.130-2-x86_64.pkg.tar.xz
RUN pacman -U --noconfirm cuda-10.0.130-2-x86_64.pkg.tar.xz
RUN wget https://neweraweb.de/yay-9.2.0-1-x86_64.pkg.tar.xz
RUN pacman -U --noconfirm yay-9.2.0-1-x86_64.pkg.tar.xz
RUN yay -Syu --noconfirm gcc7-libs
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
