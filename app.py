from flask import Flask
from redis import Redis

my_redis = Redis(host="172.16.1.20", port=6379, decode_responses=True)

app = Flask(__name__)


@app.get("/<string:name>")
def set_key(name: str):
    my_redis.set(name=name, value="1", ex=172800)
    return {"message": "ok"}, 200


@app.get("/")
def home():
    return {"message": "Hello"}, 200


if "__main__" == __name__:
    host = "0.0.0.0"
    app.run(host, port=5050, debug=True)
