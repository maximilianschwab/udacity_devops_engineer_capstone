#!/usr/bin/env bash

PORT=8080
echo "Port: $PORT"

# POST method predict
curl -d '{
    "number1":1,
    "number2":2
}'\
     -H "Content-Type: application/json" \
     -X POST http://localhost:$PORT/sum_up
