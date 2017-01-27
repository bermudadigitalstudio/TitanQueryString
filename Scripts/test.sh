#!/usr/bin/env bash

set -ex
docker build . -t titanquery \
  && docker run --rm -it titanquery
