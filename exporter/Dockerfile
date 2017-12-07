FROM python:3
MAINTAINER Henrik Nymann Jensen <hnje@prevas.dk>

# install labgrid
RUN pip install git+https://github.com/labgrid-project/labgrid.git && \
    git clone https://github.com/labgrid-project/labgrid /opt/labgrid

# install tools
RUN apt-get update; \
    apt-get install ser2net -y;

# add files
COPY config.yaml /opt/labgrid-exporter/
COPY entrypoint.sh /opt/labgrid-exporter/

ENTRYPOINT ["/opt/labgrid-exporter/entrypoint.sh"]
