FROM python:alpine3.15
RUN apk update && apk add --no-cache bash && pip3 install awxkit
ENTRYPOINT ["/bin/bash"]