from flask import Flask, jsonify
import sys

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify(message="Hello DevOps", version="1.0.0")

@app.route("/health")
def health():
        return jsonify(status="error"), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)