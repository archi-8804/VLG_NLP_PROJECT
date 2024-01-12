# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory to /app
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Copy the contents of the local models directory to the container at /app/models
COPY ./models /app/models

# Copy the server.py file to the container at /app/server.py
COPY server.py /app/server.py

# Expose port 5000 from the container
EXPOSE 5000

# Run app.py when the container launches
CMD ["python", "server.py"]
