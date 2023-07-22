#!/bin/bash

yum makecache fast
yum repolist
yum update -y
