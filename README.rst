Labgrid Docker files
====================

Purpose
-------
This repository contains docker files to build a Docker image for the following Labgrid instances:

- **labgrid coordinator** (Crossbar) This instance simply configures a Labgrid coordinator instance the image is build by:

  .. code-block:: bash

     $ cd coordinator
     $ docker build -t <coordinator-image-name> .

- **labgrid exporter** This instance contains the Labgrid exporter. The exporter needs a configuration file, listing the resources to be exported. A default config.yaml is shipped that exports a raw serial port ttyUSB0.

  .. code-block:: bash

     $ cd exporter
     $ <editor of choice> config.yaml
     $ docker build -t <exporter-image-name> .

- **labgrid client** This instance contains the Labgrid client tools. The image is build by:

  .. code-block:: bash

     $ cd client
     $ docker build -t <client-image-name> .

Run-time usage
--------------
To spin-up a container instance from the desired image use *docker run*:

- **labgrid coordinator**

  .. code-block:: bash

     $ docker run -d --net=host --name labgrid-coordinator <coordinator-image-name>

- **labgrid exporter**: To use custom config map a volume to /opt/labgrid-exporter/config.yaml or to another path and specify the new config location
  as the last argument <config> when starting the container.

  .. code-block:: bash

     $ docker run -d -v /run/udev:/run/udev:ro -v /dev:/dev:ro --privileged --name labgrid-exporter --hostname=127.0.0.1 <exporter-image-name> <ip> <config>

- **labgrid client** The image will start a shell where the labgrid-client is accessible.

  .. code-block:: bash

     $ docker run -it --net=host --name labgrid-client <client-image-name>

  **Note:** If the coordinator is not using the host network, remember to specify coordinator ip when using labgrid-client, like shown below.

  .. code-block:: bash
     
     $ labgrid-client -x ws://<IP>:20408/ws resources
