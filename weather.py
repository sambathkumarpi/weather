from flask import Flask, render_template, request
import requests

app = Flask(__name__)

def get_weather(api_key, city):
    base_url = f"http://api.weatherapi.com/v1/current.json"
    params = {
        'key': api_key,
        'q': city
    }

    response = requests.get(base_url, params=params)

    if response.status_code == 200:
        data = response.json()
        return data
    else:
        return None

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        api_key = '62181346989e48cdbef185423242901'  # Replace with your WeatherAPI key
        city = request.form['city']
        weather_data = get_weather(api_key, city)

        if weather_data:
            temperature = weather_data['current']['temp_c']
            condition = weather_data['current']['condition']['text']

            return render_template('index.html', city=city, temperature=temperature, condition=condition)
        else:
            return render_template('index.html', error="Error retrieving weather data.")
    else:
        return render_template('index.html')

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
