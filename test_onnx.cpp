#include "onnx/onnx.pb.h"
#include "onnx/checker.h"
#include "onnx/onnx-operators.pb.h"
#include <fstream>
#include <cassert>
#include <iostream>


int main(void) {
        ONNX_NAMESPACE::ModelProto model;
        std::ifstream in("mnist.onnx", std::ios_base::binary);
        model.ParseFromIstream(&in);
        in.close();
        ONNX_NAMESPACE::checker::check_model(model);
        std::cout<<"no problem with model?\n";
}

