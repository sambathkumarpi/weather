# Use the official Python image as the base image
FROM python:3.8-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY weather.py /app/
COPY templates /app/templates


# Expose port 5000 to the outside world
EXPOSE 5000

# Define environment variable for Flask
ENV FLASK_APP=weather.py

# Create a new user named 'sambath'
RUN adduser -D -u 1000 sambath && chown -R sambath:sambath /app

# Set the ownership of the /app directory to the 'sambath' user
# RUN chown -R sambath:sambath /app

# Switch to the 'sambath' user
USER sambath

# Run the Flask application when the container launches
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
