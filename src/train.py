import pickle
import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report
from preprocessing import X_train_processed, X_test_processed, y_train, y_test

model = RandomForestClassifier(
    n_estimators=200,
    max_depth=10,
    random_state=42
)

model.fit(X_train_processed, y_train)

y_pred = model.predict(X_test_processed)
print(classification_report(y_test, y_pred))

with open("model/churn_model.pkl", "wb") as f:
    pickle.dump(model, f)

print("Model trained and saved successfully.")
