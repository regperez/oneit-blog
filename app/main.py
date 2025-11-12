from flask import Flask, render_template
import os
import sys

app = Flask(__name__)

@app.route("/")
def index():
    db_url = os.environ.get("DATABASE_URL", "NOT SET")
    return f"Hola desde Flask! DB: {db_url}"

@app.route("/health")
def health():
    """Health check endpoint"""
    return {"status": "ok"}, 200

if __name__ == "__main__":
    db_url = os.environ.get("DATABASE_URL")
    if not db_url:
        print("WARNING: DATABASE_URL not set. App will start but DB connection will fail.", file=sys.stderr)
    
    print(f"Starting Flask app on 0.0.0.0:5000", file=sys.stderr)
    print(f"DATABASE_URL: {db_url}", file=sys.stderr)
    
    try:
        app.run(host="0.0.0.0", port=5000, debug=False)
    except Exception as e:
        print(f"ERROR: Failed to start Flask app: {e}", file=sys.stderr)
        sys.exit(1)

