import pandas as pd
import pickle
from sklearn.model_selection import train_test_split
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import StandardScaler, OneHotEncoder

df = pd.read_csv("data/customer_churn_data.csv")

X = df.drop("Churn", axis=1)
y = df["Churn"].map({"Yes": 1, "No": 0})

num_features = X.select_dtypes(include=["int64", "float64"]).columns
cat_features = X.select_dtypes(include=["object"]).columns

num_cols = [
    "tenure",
    "MonthlyCharges"
]

cat_cols = [
    "gender",
    "SeniorCitizen",
    "Contract",
    "PaymentMethod"
]

preprocessor = ColumnTransformer(
    transformers=[
        ("num", StandardScaler(), num_cols),
        ("cat", OneHotEncoder(handle_unknown="ignore"), cat_cols)
    ]
)


X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

X_train_processed = preprocessor.fit_transform(X_train)
X_test_processed = preprocessor.transform(X_test)

with open("model/preprocessor.pkl", "wb") as f:
    pickle.dump(preprocessor, f)

print("Preprocessing completed and saved.")