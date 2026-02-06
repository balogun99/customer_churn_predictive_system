import streamlit as st
from src.predict import predict_churn

st.set_page_config(page_title="Customer Churn Prediction", layout="centered")

st.title("📉 Customer Churn Prediction App")

customerID = st.sidebar.slider("Customer ID", 0,5879)
gender = st.sidebar.selectbox("Gender", ["Male", "Female"])
senior = st.sidebar.selectbox("Senior Citizen", ["No", "Yes"])
partner = st.sidebar.selectbox("Has Partner?", ["Yes", "No"])
dependents = st.sidebar.selectbox("Has Dependents?", ["Yes", "No"])
tenure = st.sidebar.slider("Tenure (Months)", 0, 72, 12)
PhoneService = st.sidebar.selectbox("Phone Service", ["Yes", "No"])
MultipleLines = st.sidebar.selectbox("Has Multiple Lines?", ["No phone Service", "Yes", "No"])
InternetService = st.sidebar.selectbox("Internet Service", ["No", "DSL", "Fiber optic"])
OnlineSecurity	= st.sidebar.selectbox("Online Security", ["Yes", "No", "No internet service"])
OnlineBackup = st.sidebar.selectbox("Online Backup", ["Yes", "No", "No internet service"])
DeviceProtection = st.sidebar.selectbox("Device Protection", ["Yes", "No", "No internet service"])
TechSupport = st.sidebar.selectbox("Tech Support", ["Yes", "No", "No internet service"])
StreamingTV = st.sidebar.selectbox("Streaming TV", ["Yes", "No", "No internet service"])
StreamingMovies = st.sidebar.selectbox("Streaming Movies", ["Yes", "No", "No internet service"])
Contract = st.sidebar.selectbox("Contract", ["Month-to-month", "One year", "Two year"])
PaperlessBilling = st.sidebar.selectbox("Paperless Billing", ["Yes", "No"])
PaymentMethod = st.sidebar.selectbox("Payment Method", ["Electronic check", "Bank Transfer (automatic)", "Credit Card (automatic)"])
# Payment Method
# 1. Electronic check
# 2. Bank transfer (automatic)
# 3. Credit card (automatic)
MonthlyCharges = st.sidebar.slider("Monthly Charges", 20.0, 150.0, 70.0)
TotalCharges = st.sidebar.slider("Total Charges", 20.0, 9000.0, 1000.0)

if st.button("Predict Churn"):
    input_data = {
        "customerID": customerID,
        "gender": gender,
        "SeniorCitizen": str(senior), #1 if senior == "Yes" else 0,
        "Partner": partner,
        "Dependents": dependents,
        "tenure": tenure,
        "PhoneService": PhoneService,
        "MultipleLines": MultipleLines,
        "InternetService": InternetService,
        "OnlineSecurity": OnlineSecurity,
        "OnlineBackup": OnlineBackup,
        "DeviceProtection": DeviceProtection,
        "TechSupport": TechSupport,
        "StreamingTV": StreamingTV,
        "StreamingMovies": StreamingMovies,
        "Contract": Contract,
        "PaperlessBilling": PaperlessBilling,
        "PaymentMethod": PaymentMethod,
        "MonthlyCharges": MonthlyCharges,
        "TotalCharges": TotalCharges
    }

    result = predict_churn(input_data)

    st.subheader("Prediction Result")
    st.write("**Churn:**", result["churn_prediction"])
    st.write("**Churn Probability:**", result["churn_probability"])