FROM python:3.9.17

# Install system libraries
RUN apt-get update && apt-get install -y libsm6 libxrender1 libfontconfig1 libice6 libgl1 libgl1-mesa-glx libglu1 libgl1-mesa-dev

# Set the working directory
WORKDIR /app

# Copy application code and files to the container
COPY . /app

# Install Python dependencies
RUN pip install -r requirements.txt

# Start your Flask application
CMD ["gunicorn", "-k", "eventlet", "-w", "1", "app:app"]
