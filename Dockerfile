FROM centos:latest

LABEL name="CentOS Ansible"

COPY requirements.txt /tmp/requirements.txt

RUN echo "Updating the Image with the latest" && \
    dnf update -y && \
    dnf install python3-pip curl wget git -y && \
    pwd && \
    python3 -m pip install -r /tmp/requirements.txt && rm /tmp/requirements.txt

ENV container oci
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

CMD ["/bin/bash"]
