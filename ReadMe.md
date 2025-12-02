**Project Overview**  
The goal of this project was to predict whether an individual's annual income exceeds $50,000 using demographic and employment attributes. I built and compared Logistic Regression, Support Vector Machine (SVM), and K-Means clustering models, applying extensive preprocessing, scaling, cross-validation, and hyperparameter tuning to improve performance and generalisation.

**Process & Methodology**  
1. Data Loading & Cleaning  
Imported the income.csv dataset using pandas.  
Identified missing values (∼5.4% of rows) in Workclass and Occupation and removed them due to low percentage and categorical nature.  
Checked and removed duplicate entries, reducing the dataset to 20,798 rows.  

2. Feature Engineering & Encoding  
Converted categorical variables into numerical form:  
Binary encoding (e.g., Sex: Female = 1, Male = 0)  
Ordinal encoding (e.g., Education from “Preschool” = 1 → “Doctorate” = 16)  
One-hot encoding for non-ordinal categorical features  
Split data into X (features) and y (target).  

3. Model Development  
Built two supervised models:  
Logistic Regression  
Support Vector Machine (SVM) with kernel tuning  
And one unsupervised model:  
K-Means Clustering for behaviour-based segmentation  

4. Cross-Validation  
Performed 10-fold cross validation to reduce variance and check generalisation:  
Model	CV Accuracy  
Logistic Regression	0.8022  
SVM	0.8025  
The k-fold results were slightly lower than single-split accuracy, indicating the single split was overly optimistic—CV offers a more realistic evaluation.  

5. Hyperparameter Tuning  
Conducted GridSearchCV to tune:  

**Logistic Regression**  
Penalty:  
  &nbsp;o Chosen - L1 forces some coefficients to shrink to zero, helping feature selection. This  
was chosen as the best due to having many dummy variables; not all may contribute  
much to prediction.  
  &nbsp;o L2 shrinks coefficients but ultimately keeps them instead of reducing to zero.  
• C (regularisation strength):  
  &nbsp;o This controls the penalty strength; the smaller the C is, the stronger the  
&nbsp;regularisation is, leading to simpler models. The best score was 30, which means  
&nbsp;that the model benefitted from having a weaker regularisation and a more complex  
&nbsp;model.  
• Solver:  
  &nbsp;o Liblinear is better for small to medium-sized datasets  
  &nbsp;o Chose – Saga works well for larger datasets. This solver was able to handle the high  
&nbsp;dimensionality better than liblinear.  

**SVM**  
Kernel:  
  &nbsp;o Linear assumes that the dataset can be linearly separated by features  
 &nbsp;o Chosen – Poly better captures datasets that have complex relationships between  
  &nbsp;categorical and numerical variables, which lead to a higher accuracy.  
• C:  
  &nbsp;o Similar to Logistic Regression above. In this case, a C of 10 had the best result, which  
  &nbsp;means that it is less complex and has a stronger regularisation than the Logistic  
  &nbsp;Regression model.  
• Degree - controls the complexity of the kernels  
  &nbsp;o 2 captures quadratic boundaries  
  &nbsp;o Chosen – 3 captures cubic boundaries, which had the right balance without  
  &nbsp;overfitting the model  
• Gamma – how far a single datapoint affects the decision boundary  
  &nbsp;o Chosen – Scale uses the formula 1/n_feature x variance, effectively adjusting to the  
  &nbsp;variance of the dataset, leading to smoother boundaries  
