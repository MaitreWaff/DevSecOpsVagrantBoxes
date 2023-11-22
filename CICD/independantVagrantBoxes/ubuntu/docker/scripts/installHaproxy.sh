#!/bin/bash

apt-get install -y haproxy
# systemctl status haproxy
systemctl enable haproxy
systemctl restart haproxy
