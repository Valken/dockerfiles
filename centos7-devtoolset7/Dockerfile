FROM centos:7
RUN yum install -y centos-release-scl python3 bison && \
    yum-config-manager --enable rhel-server-rhscl-7-rpms && \
    yum install -y devtoolset-7

ENTRYPOINT scl enable devtoolset-7 bash
