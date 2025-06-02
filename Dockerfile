# # Base image
# FROM python:3.10-slim

# # Set work directory
# WORKDIR /app

# # Copy all files needed
# COPY app/ app/
# COPY model/ model/
# COPY app/requirements.txt .

# # Install dependencies
# RUN pip install --no-cache-dir -r requirements.txt

# # Expose port
# EXPOSE 10000

# # Run the app using uvicorn (FastAPI) or adjust if using Flask
# CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "10000"]
# Base image
FROM python:3.10-slim

# Set work directory
WORKDIR /app

# Copy all files needed
COPY app/ app/
COPY model/ model/
COPY app/requirements.txt .

# Install system dependencies, including GCC
RUN apt-get update && apt-get install -y gcc \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 10000

# Run the app using uvicorn (FastAPI) or adjust if using Flask
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "10000"]
