#!/bin/bash

PATH=$PATH:$LAMBDA_TASK_ROOT/bin \
    PYTHONPATH=$PYTHONPATH:/opt/python:$LAMBDA_RUNTIME_DIR \
    exec python -m awslabs.aws_documentation_mcp_server.server --streamable-http
