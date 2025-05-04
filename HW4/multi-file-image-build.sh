#!/bin/bash 
docker build -t system ./System 
docker build -t builder ./Builder
docker build -t runner ./Runner
docker run -it -p 8898:8898 runner 