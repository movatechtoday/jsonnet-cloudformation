#!/bin/bash

rm -rf build
mkdir build

jsonnet --jpath vendor $1 > build/cloudformation.json