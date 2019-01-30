FROM java:8

ENV VERSION="R2015a"

RUN wget -O /tmp/installer.zip http://ssd.mathworks.com/supportfiles/downloads/${VERSION}/deployment_files/${VERSION}/installers/glnxa64/MCR_${VERSION}_glnxa64_installer.zip

WORKDIR /tmp

RUN unzip installer.zip -d /tmp/matlab && \
    rm installer.zip && \
    matlab/install -mode silent -agreeToLicense yes -destinationFolder /opt/matlab && \
    rm -Rf matlab

ENV LD_LIBRARY_PATH="/opt/matlab/v85/runtime/glnxa64:/opt/matlab/v85/bin/glnxa64:/opt/matlab/v85/sys/os/glnxa64:$LD_LIBRARY_PATH"
