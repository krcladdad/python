
# Use official Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies
RUN pip install --upgrade pip &&     python -m pip install --upgrade pip &&  pip install coverage pytest 

# Run the calculator
CMD ["python", "calculator.py"]
