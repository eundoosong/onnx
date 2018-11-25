FROM ubuntu:16.04

RUN apt-get update && apt-get install -y protobuf-compiler libprotoc-dev git python3 python3-pip cmake
RUN ln -s /usr/bin/python3  /usr/bin/python
RUN git clone https://github.com/onnx/onnx.git

WORKDIR onnx
RUN git checkout v1.3.0 
RUN git submodule update --init --recursive
RUN python3 setup.py install

CMD /bin/bash
