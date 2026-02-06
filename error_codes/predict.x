# import joblib
# import pandas as pd

# model = joblib.load("models/churn_model.pkl")
# preprocessor = joblib.load("models/preprocessor.pkl")

# def predict_churn(input_data:dict):
#     df = pd.DataFrame([input_data])
#     prediction  = model.predict(df)[0]
#     probability = model.predict_proba(df)[0][1]
#     return prediction, probability


# def predict_churn(input_data: dict):
#     df = pd.DataFrame([input_data])
#     processed = preprocessor.transform(df)
#     prediction = model.predict(processed)[0]
#     probability = model.predict_proba(processed)[0][1]

#     return {
#         "churn_prediction": "Yes" if prediction == 1 else "No",
#         "churn_probability": round(probability, 2)
#     }