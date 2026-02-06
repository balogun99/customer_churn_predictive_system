# import os
# import pandas as pd
# import joblib
# from sklearn.model_selection import train_test_split
# from sklearn.ensemble import RandomForestClassifier
# from sklearn.pipeline import Pipeline
# from preprocessing import build_preprocess
# from sklearn.compose import ColumnTransformer
# from sklearn.preprocessing import StandardScaler, OneHotEncoder


# os.makedirs("models", exist_ok=True)

# df = pd.read_csv('data/customer_churn_data.csv')

# df['TotalCharges'] = pd.to_numeric(df['TotalCharges'], errors='coerce')
# df.dropna(inplace=True)

# X = df.drop('Churn', axis=1)
# y = df['Churn'].map(
#     {
#         "Yes": 1,
#         "No": 0
#     }
# )

# categorical_cols = df.select_dtypes(include='object').columns #.drop('Churn')
# categorical_cols = categorical_cols.drop("Churn")

# numerical_cols = df.select_dtypes(exclude='object').columns

# num_pipeline = Pipeline(steps=[
#     ('scaler', StandardScaler())
# ])

# cat_pipeline = Pipeline(steps=[
#     ('encoder', OneHotEncoder(handle_unknown='ignore'))
# ])

# prepreocessor = build_preprocess(df)

# model = RandomForestClassifier(
#     n_estimators=200,
#     random_state=42,
#     # max_depth=0
# )

# pipeline = Pipeline(steps=[
#     ('preprocessor', prepreocessor),
#     ('model', model)
# ])

# preprocessor = ColumnTransformer(
#         transformers=[
#             ('num', num_pipeline, numerical_cols),
#             ('cat', cat_pipeline, categorical_cols)
#         ]
#     )

# for col in categorical_cols:
#     X[col] = X[col].astype(str)

# X_train, X_test, y_train, y_test = train_test_split(
#     X, y, test_size=0.3, random_state=42, stratify=y
# )

# pipeline.fit(X_train, y_train)
# X_train_processed = preprocessor.fit(X_train)

# joblib.dump(pipeline, "models/churn_model.pkl")
# joblib.dump(prepreocessor, "models/preprocessor_model.pkl")

# print("Model Saved Successfully in models/....")
# print("Preprocessor Saved Successfully in models/....")