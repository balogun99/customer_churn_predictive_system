import pickle
import pandas as pd

with open("model/churn_model.pkl", "rb") as f:
    model = pickle.load(f)

with open("model/preprocessor.pkl", "rb") as f:
    preprocessor = pickle.load(f)

def predict_churn(input_data: dict):
    df = pd.DataFrame([input_data])

    # 🔥 FORCE SAME TYPES AS TRAINING
    df["SeniorCitizen"] = df["SeniorCitizen"].astype(str)
    df["gender"] = df["gender"].astype(str)
    df["Contract"] = df["Contract"].astype(str)
    df["PaymentMethod"] = df["PaymentMethod"].astype(str)

    df["tenure"] = df["tenure"].astype(int)
    df["MonthlyCharges"] = df["MonthlyCharges"].astype(float)

    processed = preprocessor.transform(df)

    prediction = model.predict(processed)[0]
    probability = model.predict_proba(processed)[0][1]

    return {
        "churn_prediction": "Yes" if prediction == 1 else "No",
        "churn_probability": round(probability, 2)
    }
