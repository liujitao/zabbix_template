#!/bin/bash

#by caton wang

rabbitmqctl list_queues messages consumers name|awk '$3~/^compute\.node/ {print $0}'|wc -l
