import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv("data/customer_churn_data.csv")

print(df.head())
print(df.info())
print(df.describe())

# Target distribution
sns.countplot(x="Churn", data=df)
plt.title("Churn Distribution")
plt.show()

# Correlation heatmap
plt.figure(figsize=(10, 6))
sns.heatmap(df.select_dtypes(include="number").corr(), annot=True)
plt.title("Correlation Heatmap")
plt.show()
