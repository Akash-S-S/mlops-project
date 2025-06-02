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
# FROM python:3.10-slim

# # Set work directory
# WORKDIR /app

# # Copy all files needed
# COPY app/ app/
# COPY model/ model/
# COPY app/requirements.txt .

# # Install system dependencies, including GCC
# RUN apt-get update && apt-get install -y gcc \
#     && rm -rf /var/lib/apt/lists/*

# # Install Python dependencies
# RUN pip install --no-cache-dir -r requirements.txt

# # Expose port
# EXPOSE 10000

# # Run the app using uvicorn (FastAPI) or adjust if using Flask
# CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "10000"]

# Base image
# FROM python:3.10-slim

# # Set work directory
# WORKDIR /app

# # Copy all files needed
# COPY app/ app/
# COPY model/ model/
# COPY app/requirements.txt .

# # Install system dependencies, including GCC and Fortran
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     gcc g++ gfortran \
#     libopenblas-dev liblapack-dev \
#     && rm -rf /var/lib/apt/lists/*

# # Install Python dependencies
# RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt

# # Expose port
# EXPOSE 10000

# # Run the app using uvicorn (FastAPI) or adjust if using Flask
# CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "10000"]

# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /app

# Copy requirements.txt first to leverage Docker layer caching
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port FastAPI runs on
EXPOSE 8000

# Command to run the app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
