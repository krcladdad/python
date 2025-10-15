# app.py
from flask import Flask, render_template, request
import calculator

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def calculate():
    result = None
    error = None

    if request.method == 'POST':
        try:
            num1 = float(request.form['num1'])
            num2 = float(request.form['num2'])
            operation = request.form['operation']

            if operation == 'add':
                result = calculator.add(num1, num2)
            elif operation == 'subtract':
                result = calculator.subtract(num1, num2)
            elif operation == 'multiply':
                result = calculator.multiply(num1, num2)
            elif operation == 'divide':
                result = calculator.divide(num1, num2)
            else:
                error = "Invalid operation selected."
        except Exception as e:
            error = str(e)

    return render_template('index.html', result=result, error=error)

if __name__ == '__main__':
    app.run(debug=True)