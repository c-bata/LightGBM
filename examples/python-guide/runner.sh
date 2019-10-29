#!/bin/bash

echo '/tmp/core.%h.%e.%t' > /proc/sys/kernel/core_pattern

for i in {1..100}; do python advanced_example.py; done
