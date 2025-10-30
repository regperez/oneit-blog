from flask import Flask, render_template
import os
import psycopg2

app = Flask(__name__)

@app.route("/")
def index():
    db_url = os.environ.get("DATABASE_URL")
    return f"Hola desde Flask! DB: {db_url}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
