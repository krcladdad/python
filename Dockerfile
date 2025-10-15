
# Use official Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies
RUN pip install --upgrade pip  && pip install -r requirements.txt 


# Expose Flask default port
EXPOSE 5000

# Run the calculator
CMD ["python", "app.py"]
