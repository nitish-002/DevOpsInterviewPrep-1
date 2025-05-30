#!/bin/bash

echo "Testing Flask app..."

# Wait for the app to start
echo "Waiting for Flask app to start..."
sleep 5

# Test if the app responds
response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:5000)

if [ "$response" -eq 200 ]; then
    echo "✅ Test passed: App is responding with status 200"
    docker stop test-container
    exit 0
else
    echo "❌ Test failed: App responded with status $response"
    docker logs test-container
    docker stop test-container
    exit 1
fi
