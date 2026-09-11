#!/bin/bash

set -e

git pull
sudo cp index.html /usr/share/nginx/html

echo "Deployment completed successfully"