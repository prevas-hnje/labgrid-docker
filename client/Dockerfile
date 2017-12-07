FROM python:3
MAINTAINER Henrik Nymann Jensen <hnje@prevas.dk>

# install tools
RUN apt-get update; \
    apt-get install vim -y; \
    apt-get install microcom -y; \

# install labgrid
RUN pip3 install git+https://github.com/labgrid-project/labgrid.git

# copy examples to get quickly started
COPY examples /usr/share/labgrid-examples
CMD ["/bin/bash"]
