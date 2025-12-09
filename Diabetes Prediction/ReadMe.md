**Project Overview**  
This project predicts diabetes risk using clinical and behavioural metrics. I evaluated multiple algorithms and optimised XGBoost with SHAP interpretability. The final model ranked 6th out of 68 participants in a [Kaggle competition](https://www.kaggle.com/competitions/predicting-diabetes-risk-from-lifestyle-health/leaderboard) based on the F1 score:  

<img width="748" height="397" alt="image" src="https://github.com/user-attachments/assets/e7e0bc7a-cb00-4b4b-a4ce-5f7b34ec4c7e" />  


**Exploratory Data Analysis**  

EDA focused on identifying patterns that describe diabetes risk and understanding the distribution of key variables. Highlights include:  
-BMI and cholesterol distributions were positively skewed  
-A moderate correlation between diabetes and lifestyle variables (smoking, physical inactivity)  
-Clear class imbalance that required careful metric choice during evaluation  
-Visualisations such as histograms, pairplots, correlation heatmaps, and bar charts helped inform preprocessing decisions  

Initial insights showed that metabolic indicators were consistently higher among diabetic patients.  

**Feature Engineering**  
A dedicated function add_engineered_features() creates clinically intuitive features that strengthen predictive signal:  
-BMI_Age ratio (BMI relative to age)  
-Physically_Unhealthy = PhysHlth > 10  
-Mentally_Unhealthy = MentHlth > 10  
-Obese = BMI ≥ 30  
-Old = Age ≥ 9 (category threshold used in dataset coding)  
-HighRiskCombo = HighBP & HighChol & Smoker  

These features reflect health risk clustering patterns that typically correlate strongly with diabetes prevalence.  

**Threshold Tuning for F1 Score**  
Instead of relying on a default threshold (0.5), the notebook performs a brute-force search across thresholds 0.20–0.80 to maximise F1 score for the positive class (diabetes).  
This is crucial because the dataset is imbalanced, and F1 is more sensitive to recall/precision tradeoffs  

**Model Comparison**  
Multiple models were then evaluated to see which one would give the best performance for this dataset. I ran the following models below and checked each classification report: 
<img width="556" height="212" alt="image" src="https://github.com/user-attachments/assets/4a1b8143-0d32-4326-a6ef-6cb269a95a31" />  

The best model is the Balanced LightBGM model, with a threshold of 0.63:  
<img width="423" height="233" alt="image" src="https://github.com/user-attachments/assets/2fa976fe-438d-4d7c-bd4e-9c9fe415632b" />  

