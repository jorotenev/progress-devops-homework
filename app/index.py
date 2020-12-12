from flask import Flask
import redis
from os import getenv
app = Flask(__name__)
client = redis.Redis(host='redis_host')

@app.route("/")
def hello():
    return "Hello World!"
    
@app.route('/test_redis_write')
def write_redis():
    counter = int(client.get('counter') or 0) + 1
    client.set('counter', counter)
    return f"[{getenv('CUSTOM_GREETING')}] counter updated to {counter}"
    
@app.route('/test_redis_read')
def read_redis():
    return client.get('counter') or '0'
    
if __name__ == "__main__":
    # heroku ingests the PORT env var
    app.run(host="0.0.0.0", port='5000', debug=True)
