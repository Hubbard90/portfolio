# Diabetes Risk Prediction

## Introduction

Diabetes can develop gradually, and many people may remain unaware that they are at risk until symptoms become more serious. Early identification can help healthcare providers prioritise preventive support and recommend clinical testing before complications occur.

This project develops a machine learning model that estimates diabetes risk using clinical, demographic, and behavioural information. Rather than replacing medical diagnosis, the model is designed as an early screening tool that can identify individuals who may benefit from further assessment.

The final solution ranked **6th out of 68 participants** in a Kaggle competition based on the F1 score.

<img width="748" height="224" alt="image" src="https://github.com/user-attachments/assets/fb8e76ca-1b14-4d7c-80c1-d170dd3bb58a" />

## Problem Overview

The goal was to predict whether an individual was at risk of diabetes using variables such as:

* Body mass index
* Blood pressure and cholesterol status
* General, physical, and mental health
* Age
* Smoking history
* Physical activity
* Other lifestyle and health indicators

The main modelling challenge was class imbalance. Non-diabetic cases were more common than diabetic cases, meaning that accuracy alone could produce a misleading evaluation. A model could achieve high accuracy by predicting the majority class while still failing to identify many individuals who were genuinely at risk.

For this reason, the project focused on the **F1 score**, which balances precision and recall and provides a more meaningful measure of positive-class performance.

## Approach

### Exploratory Data Analysis

Exploratory analysis was conducted to understand the distribution of the variables and identify patterns associated with diabetes risk.

The analysis found that:

* BMI and cholesterol-related variables showed positively skewed distributions.
* Metabolic indicators were generally higher among individuals with diabetes.
* Smoking and physical inactivity showed relationships with diabetes risk.
* The target variable was imbalanced, reinforcing the need to use metrics beyond accuracy.

### Feature Engineering

A reusable function, `add_engineered_features()`, was created to generate additional variables that represented combinations of health risks.

The engineered features included:

* **BMI_Age:** BMI relative to age
* **Physically_Unhealthy:** More than 10 physically unhealthy days
* **Mentally_Unhealthy:** More than 10 mentally unhealthy days
* **Obese:** BMI of 30 or above
* **Old:** Higher age category based on the dataset coding
* **HighRiskCombo:** Combination of high blood pressure, high cholesterol, and smoking

These features were created to represent risk clustering rather than treating each health indicator independently. For example, a person with high blood pressure, high cholesterol, and a history of smoking may have a different risk profile from someone with only one of these conditions.

### Model Comparison

Multiple classification algorithms were trained and evaluated using classification reports and F1-based performance measures.

The model comparison included:  

* Logistic Regression  
<img width="296" height="93" alt="image" src="https://github.com/user-attachments/assets/91cb57df-721a-4133-8877-40b07e8ffa0b" />

* Random Forest  
<img width="286" height="91" alt="image" src="https://github.com/user-attachments/assets/59fa2294-3964-4a64-aff5-584665688ad0" />

* XGBoost  
<img width="312" height="84" alt="image" src="https://github.com/user-attachments/assets/b4046e5d-656b-437f-b414-039f1e700150" />

* LightGBM  
<img width="282" height="34" alt="image" src="https://github.com/user-attachments/assets/bc066fbf-4cc6-4859-8587-747b270724d5" />


Balanced LightGBM produced the strongest overall result. It provided the best balance between detecting positive diabetes cases and limiting incorrect positive predictions.

### Threshold Optimisation

Instead of using the default classification threshold of `0.50`, I tested thresholds between `0.20` and `0.80`.

The probability threshold determines when a prediction is classified as diabetic. Lowering the threshold generally increases recall but may produce more false positives, while raising it can improve precision but increase the risk of missing positive cases.

A threshold of **0.63** produced the strongest F1 score for the Balanced LightGBM model.

### Model Interpretation

SHAP analysis was used to explain how individual variables contributed to the model’s predictions. This added transparency to the modelling process by showing which health and behavioural indicators increased or decreased predicted diabetes risk.

Interpretability is particularly important in healthcare-related applications because decision-makers need more than a probability. They also need to understand the factors influencing the result.

<img width="782" height="940" alt="image" src="https://github.com/user-attachments/assets/da8bfd70-a0a8-4a1a-9409-e113172212a9" />

### SHAP Interpretation

The SHAP summary plot shows how each feature influenced the model’s diabetes predictions across the dataset.

Features are ranked from most to least influential. Points positioned to the right of zero increased the model’s predicted diabetes risk, while points to the left reduced it. The colour represents the feature value, with blue indicating lower values and pink indicating higher values.

The main findings were:

- **General health (`GenHlth`) was the most influential feature.** Higher general-health category values strongly increased predicted diabetes risk, while lower values reduced it. This suggests that people reporting poorer overall health were more likely to be classified as diabetic.
- **BMI was one of the strongest continuous predictors.** Higher BMI values generally pushed predictions towards diabetes, while lower BMI values reduced the predicted risk.
- **Age showed a similar pattern.** Higher age categories increased the model output, indicating that diabetes risk generally rose among older individuals.
- **Blood pressure and cholesterol status had a strong influence.** The absence of high blood pressure (`HighBP_No`) and high cholesterol (`HighChol_No`) generally reduced predicted risk, while the corresponding positive indicators pushed predictions towards diabetes.
- **Income and education showed an inverse relationship with risk.** Lower values tended to increase predicted diabetes risk, while higher values generally reduced it. This may reflect broader differences in access to healthcare, preventive services, and healthy lifestyle resources.

Overall, the SHAP analysis suggests that the model relied mainly on clinically reasonable patterns. Poor general health, higher BMI, older age, high blood pressure, and high cholesterol were the strongest factors pushing predictions towards diabetes.

Some one-hot encoded variables appear as separate `Yes` and `No` features. Their effects should be interpreted as two representations of the same original condition rather than as independent health indicators.  


## Justification

Balanced LightGBM was selected because it performed well on the imbalanced dataset while capturing nonlinear relationships and interactions between health variables.

The F1 score was prioritised because both types of classification error have practical consequences:

* A **false negative** could allow a high-risk individual to be overlooked.
* A **false positive** could lead to unnecessary concern or additional testing.

Threshold tuning was therefore an important part of the solution. The final threshold was selected based on validation performance rather than relying on the default setting.

However, the model should not be treated as a diagnostic tool. Its predictions are based on survey-style health and lifestyle information rather than clinical testing, and the results may be affected by self-reported data, sample bias, and changes in the population where the model is used.

## Business Insights

The analysis suggests that diabetes risk is rarely associated with one variable alone. Risk becomes more meaningful when metabolic, behavioural, and general health indicators occur together.

This creates several potential applications:

* **Population screening:** Healthcare providers could use survey data to identify higher-risk groups before conducting clinical tests.
* **Preventive health programs:** Individuals with combinations of obesity, inactivity, high blood pressure, and high cholesterol could be prioritised for health education or lifestyle support.
* **Resource allocation:** Clinical testing and follow-up services could be directed towards groups with higher predicted risk.
* **Patient communication:** Model explanations could help healthcare professionals discuss the main factors contributing to an individual’s risk profile.

The model could reduce unnecessary testing among clearly low-risk groups while helping ensure that higher-risk individuals do not slip through the cracks. However, the safest use would be as a decision-support tool alongside professional judgement rather than as an automated medical decision-maker.
