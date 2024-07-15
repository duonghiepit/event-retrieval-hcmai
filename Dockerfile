FROM python:3.8-slim

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip \
    libgl1-mesa-glx \
    libglib2.0-0 \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /HCMAI2023

# Copy the current directory contents into the container at /HCMAI2023
COPY . /HCMAI2023

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt \
    && pip install git+https://github.com/openai/CLIP.git

# Command to run the application
CMD ["python3", "app.py"]
