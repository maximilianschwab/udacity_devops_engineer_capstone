from flask import Flask, request, jsonify
from flask.logging import create_logger
import logging

app = Flask(__name__)
LOG = create_logger(app)
LOG.setLevel(logging.INFO)

@app.route("/")
def home():
    html = "<h3>Capstone project</h3>"
    return html.format(format)

@app.route("/sum_up", methods=['POST'])
def greet():
    # Logging the input payload
    json_payload = request.json
    LOG.info(f"JSON request payload: \n{json_payload}")
    result = json_payload['number1'] + json_payload['number2']
    LOG.info("The postet result is: %s", result)
    return jsonify({'Result': result})

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True) # specify port=8080