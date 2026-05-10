FROM python:3.9-slim

# Install FFmpeg for audio conversion
RUN apt-get update && apt-get install -y ffmpeg

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# THE FIX: Use the old environment variable method instead of the --app flag
ENV FLASK_APP=main.py
CMD ["flask", "run", "--host=0.0.0.0", "--port=10000"]
