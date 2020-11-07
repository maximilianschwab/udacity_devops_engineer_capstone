## Summary

This python application is about a flask app that exposes a very simple API to sum up two different integer numbers. It allows to send a JSON payload via a POST request with the corresponding numbers to sum up and sends the result back. The JSON payload has to be sent in the following form:
`{
    "number1":1,
    "number2":2
}`
An example POST request is provided in the sum_up_example.sh script
The result is provided in the following form:
`{
  "Result": 3
}`

# Instructions

## Run this commands on your linux machine
* Install python 3.7 with the following command: `sudo apt install python3.7` 
* Execute `make setup`
* Execute `source ~/.devops/bin/activate`
* Execute `make install`
* Execute `python app.py`
* Execute `./sum_up_example.sh` to get the sum

## Execute test
* To run the tests execute `make test`
* You find the code coverage in the htmlcov directory

## Buld and run docker image
* First of all install docker
* Use `./run_docker.sh` to build and run the docker image
* To upload the previous built image to docker hub use `./upload_docker.sh`