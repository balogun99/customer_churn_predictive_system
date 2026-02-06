# # from multiprocessing import process
# import streamlit as st
# from sklearn.compose import ColumnTransformer
# import pandas as pd
# import joblib
# import numpy as np

# # Load model and preprocessor
# model = joblib.load("models/churn_model.pkl")
# # preprocessor = joblib.load("models/preprocessor_model.pkl")

# st.set_page_config(page_title="Customer Churn Prediction", layout="wide")

# st.title("📉 Customer Churn Prediction App")
# st.write("Predict whether a customer is likely to churn using Machine Learning.")

# # Sidebar inputs
# st.sidebar.header("Customer Information")

# # # gender,SeniorCitizen,Partner,Dependents,tenure,PhoneService,
# # # MultipleLines,InternetService,OnlineSecurity,OnlineBackup,
# # # DeviceProtection,TechSupport,StreamingTV,StreamingMovies,
# # # Contract,PaperlessBilling,PaymentMethod,MonthlyCharges,
# # # TotalCharges

# def user_input():
#     customerID = st.sidebar.slider("Customer ID", 0,5879)
#     gender = st.sidebar.selectbox("Gender", ["Male", "Female"])
#     senior = st.sidebar.selectbox("Senior Citizen", ["No", "Yes"])
#     partner = st.sidebar.selectbox("Has Partner?", ["Yes", "No"])
#     dependents = st.sidebar.selectbox("Has Dependents?", ["Yes", "No"])
#     tenure = st.sidebar.slider("Tenure (Months)", 0, 72, 12)
#     PhoneService = st.sidebar.selectbox("Phone Service", ["Yes", "No"])
#     MultipleLines = st.sidebar.selectbox("Has Multiple Lines?", ["No phone Service", "Yes", "No"])
#     InternetService = st.sidebar.selectbox("Internet Service", ["No", "DSL", "Fiber optic"])
#     OnlineSecurity	= st.sidebar.selectbox("Online Security", ["Yes", "No", "No internet service"])
#     OnlineBackup = st.sidebar.selectbox("Online Backup", ["Yes", "No", "No internet service"])
#     DeviceProtection = st.sidebar.selectbox("Device Protection", ["Yes", "No", "No internet service"])
#     TechSupport = st.sidebar.selectbox("Tech Support", ["Yes", "No", "No internet service"])
#     StreamingTV = st.sidebar.selectbox("Streaming TV", ["Yes", "No", "No internet service"])
#     StreamingMovies = st.sidebar.selectbox("Streaming Movies", ["Yes", "No", "No internet service"])
#     Contract = st.sidebar.selectbox("Contract", ["Month-to-month", "One year", "Two year"])
#     PaperlessBilling = st.sidebar.selectbox("Paperless Billing", ["Yes", "No"])
#     PaymentMethod = st.sidebar.selectbox("Payment Method", ["Yes", "No"])
#     MonthlyCharges = st.sidebar.slider("Monthly Charges", 20.0, 150.0, 70.0)
#     TotalCharges = st.sidebar.slider("Total Charges", 20.0, 9000.0, 1000.0)


#     data = {
#         "customerID": customerID,
#         "gender": gender,
#         "SeniorCitizen": 1 if senior == "Yes" else 0,
#         "Partner": partner,
#         "Dependents": dependents,
#         "tenure": tenure,
#         "PhoneService": PhoneService,
#         "MultipleLines": MultipleLines,
#         "InternetService": InternetService,
#         "OnlineSecurity": OnlineSecurity,
#         "OnlineBackup": OnlineBackup,
#         "DeviceProtection": DeviceProtection,
#         "TechSupport": TechSupport,
#         "StreamingTV": StreamingTV,
#         "StreamingMovies": StreamingMovies,
#         "Contract": Contract,
#         "PaperlessBilling": PaperlessBilling,
#         "PaymentMethod": PaymentMethod,
#         "MonthlyCharges": MonthlyCharges,
#         "TotalCharges": TotalCharges
#     }
#     return pd.DataFrame([data])

# input_df = user_input()

# # Force categorical columns to string
# categorical_cols = preprocessor.transformers_[1][2]  # assumes 2nd transformer is categorical

# for col in categorical_cols:
#     input_df[col] = input_df[col].astype(str)


# # Preprocess
# # processed_input = preprocessor.transform(input_df)
# # model_input = model.fit(input_df) # ColumnTransformer


# # Prediction
# prediction = model.predict(processed_input)[0]
# # prediction = model.predict(processed_input)[0]
# probability = model.predict_proba(processed_input)[0][1]

# # Risk level
# if probability < 0.3:
#     risk = "Low Risk 🟢"
# elif probability < 0.6:
#     risk = "Medium Risk 🟠"
# else:
#     risk = "High Risk 🔴"

# # Display results
# st.subheader("🔍 Prediction Result")

# col1, col2, col3 = st.columns(3)
# col1.metric("Churn Prediction", "Yes" if prediction == 1 else "No")
# col2.metric("Churn Probability", f"{probability:.2%}")
# col3.metric("Risk Level", risk)




# import streamlit as st
# import joblib
# import pandas as pd

# model = joblib.load("models/churn_model.pkl")

# st.title("📉 Customer Churn Prediction App")

# def user_input():
#     gender = st.selectbox("Gender", ["Male", "Female"])
#     SeniorCitizen = st.selectbox("Senior Citizen", [0, 1])
#     Partner = st.selectbox("Partner", ["Yes", "No"])
#     tenure = st.slider("Tenure (Months)", 0, 72, 12)
#     MonthlyCharges = st.number_input("Monthly Charges", 0.0, 200.0, 70.0)
#     TotalCharges = st.number_input("Total Charges", 0.0, 10000.0, 2000.0)
#     Contract = st.selectbox("Contract", ["Month-to-month", "One year", "Two year"])

#     return {
#         "gender": gender,
#         "SeniorCitizen": SeniorCitizen,
#         "Partner": Partner,
#         "tenure": tenure,
#         "MonthlyCharges": MonthlyCharges,
#         "TotalCharges": TotalCharges,
#         "Contract": Contract
#     }

# input_data = user_input()

# if st.button("Predict Churn"):
#     df = pd.DataFrame([input_data])
#     pred = model.predict(df)[0]
#     prob = model.predict_proba(df)[0][1]

#     if pred == 1:
#         st.error(f"⚠️ Customer is likely to churn (Probability: {prob:.2f})")
#     else:
#         st.success(f"✅ Customer is likely to stay (Probability: {1-prob:.2f})")

        # "gender": gender,
        # "SeniorCitizen": senior,
        # "tenure": tenure,
        # "MonthlyCharges": monthly,
        # "Contract": contract,
        # "PaymentMethod": payment


# gender = st.selectbox("Gender", ["Male", "Female"])
# senior = st.selectbox("Senior Citizen", [0, 1])
# tenure = st.slider("Tenure (Months)", 0, 72, 12)
# monthly = st.number_input("Monthly Charges", 0.0, 200.0, 50.0)
# contract = st.selectbox("Contract Type", ["Month-to-month", "One year", "Two year"])
# payment = st.selectbox("Payment Method", [
#     "Electronic check", "Mailed check",
#     "Bank transfer (automatic)", "Credit card (automatic)"
# ])