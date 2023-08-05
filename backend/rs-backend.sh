#!/bin/bash

cd /home/kali/router-scan-backend
gunicorn app:app --bind 0.0.0.0:3000 --timeout 1000