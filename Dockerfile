FROM python:3.9-slim
# Install FFmpeg which is required for the audio conversion
RUN apt-get update && apt-get install -y ffmpeg
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
# Run the Flask app bound to 0.0.0.0 so Render can route traffic to it
CMD ["flask", "--app", "main.py", "run", "--host=0.0.0.0", "--port=10000"]
