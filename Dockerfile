FROM ubuntu:16.04

RUN apt-get update && apt-get install -y protobuf-compiler libprotoc-dev git python3 python3-pip cmake
RUN ln -s /usr/bin/python3  /usr/bin/python
RUN git clone https://github.com/onnx/onnx.git

WORKDIR onnx
RUN git checkout v1.3.0 
RUN git submodule update --init --recursive
RUN sed -i "s/ONNX_NAMESPACE \"onnx\"/ONNX_NAMESPACE \"ONNX_NAMESPACE\"/g" ./CMakeLists.txt

WORKDIR /onnx/build
RUN cmake ..
RUN make
COPY test_onnx.cpp ./
COPY mnist.onnx ./
RUN g++ -o test_onnx test_onnx.cpp -lonnx_proto -lprotobuf -lonnx -I/onnx -I/onnx/build -L./ -std=c++11

CMD /bin/bash
#CMD ./test_onnx
