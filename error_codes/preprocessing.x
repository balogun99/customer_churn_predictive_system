# from xml.etree.ElementInclude import include
# import pandas as pd
# import joblib
# from sklearn.preprocessing import StandardScaler, OneHotEncoder
# from sklearn.compose import ColumnTransformer
# from sklearn.pipeline import Pipeline
# from imblearn.over_sampling import SMOTE

# # from train import X_train

# def build_preprocess(df):
#     categorical_cols = df.select_dtypes(include='object').columns #.drop('Churn')
#     categorical_cols = categorical_cols.drop("Churn")

#     numerical_cols = df.select_dtypes(exclude='object').columns

#     num_pipeline = Pipeline(steps=[
#         ('scaler', StandardScaler())
#     ])

#     cat_pipeline = Pipeline(steps=[
#         ('encoder', OneHotEncoder(handle_unknown='ignore'))
#     ])

#     preprocessor = ColumnTransformer(
#         transformers=[
#             ('num', num_pipeline, numerical_cols),
#             ('cat', cat_pipeline, categorical_cols)
#         ]
#     )

#     # X_train_processed = preprocessor.fit_transform(X_train)

#     joblib.dump(preprocessor, 'models/preprocessor.pkl')

#     return preprocessor

# preprocessor = ColumnTransformer(
#     transformers=[
#         ("num", StandardScaler(), num_features),
#         ("cat", OneHotEncoder(handle_unknown="ignore"), cat_features)
#     ]
# )