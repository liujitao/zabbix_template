#!/bin/bash

# by caton wang

ceph df |head -3|sed -n 3p |awk '{print $4}'
