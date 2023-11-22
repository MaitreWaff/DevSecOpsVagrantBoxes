#!/usr/bin/python
from flask import Flask, render_template, request
app = Flask(__name__)

@app.route('/')
def bonjour():
    ip = request.remote_addr
    origin = request.headers.get('X-Forwarded-For', request.remote_addr)
    return origin + " via " + ip

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
