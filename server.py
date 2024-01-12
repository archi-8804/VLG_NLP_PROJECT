#importing necessary libraries
from flask import Flask, jsonify, request
import pandas as pd
import joblib

app = Flask(__name__)

@app.route("/predict", methods=['POST'])
def do_prediction(file_path):
    json = request.get_json()
    #loading saved model here in this python file
    model = joblib.load('combined_summaries.pkl')
    #creating data frame of JSON data
    df = pd.read_csv(file_path)
    
    audio_file = model(df)
    
    return audio_file

if __name__ == "__main__":
    app.run(host='0.0.0.0')

    