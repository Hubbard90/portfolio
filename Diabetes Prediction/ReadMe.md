**Project Overview**  
This project predicts diabetes risk using clinical and behavioural metrics. I evaluated multiple algorithms and optimised XGBoost with SHAP interpretability. The final model ranked 6th out of 68 participants in a [Kaggle competition](https://www.kaggle.com/competitions/predicting-diabetes-risk-from-lifestyle-health/leaderboard) based on F1-macro performance:  

<img width="748" height="397" alt="image" src="https://github.com/user-attachments/assets/e7e0bc7a-cb00-4b4b-a4ce-5f7b34ec4c7e" />  

**Exploratory Data Analysis**  

EDA focused on identifying patterns that describe diabetes risk and understanding the distribution of key variables. Highlights include:  
-BMI and cholesterol distributions were positively skewed  
-A moderate correlation between diabetes and lifestyle variables (smoking, physical inactivity)  
-Clear class imbalance that required careful metric choice during evaluation  
-Visualisations such as histograms, pairplots, correlation heatmaps, and bar charts helped inform preprocessing decisions  

Initial insights showed that metabolic indicators were consistently higher among diabetic patients.  
