## AutoSense Diagnostics: Predictive Maintenance System  

AutoSense Diagnostics is a conceptual edge-to-cloud AI system designed to detect and classify engine faults using real-time sensor data.  

The objective of this project is to transition vehicle servicing from reactive maintenance, where faults are addressed after failure, to a predictive maintenance approach that identifies issues early, reduces downtime, and lowers long-term costs.  

Using sensor inputs such as engine pressure, fuel consumption, emissions, and RPM, the system classifies engine health into multiple fault categories and supports downstream decisions such as maintenance scheduling, cost prediction, and real-time diagnostics.  

This directly addresses the problem of unplanned downtime and inefficient maintenance cycles, which lead to significant operational and financial losses.

---

## Dataset  

The model is built using the **[EngineFaultDB dataset]([url](https://www.kaggle.com/datasets/ziya07/engine-fault-detection-data))**, which contains 55,999 records of engine sensor readings collected under both normal and fault-induced conditions.  

The dataset includes key variables such as:
- Manifold Absolute Pressure (MAP)  
- Throttle Position (TPS)  
- RPM  
- Fuel consumption  
- Emissions (CO, CO₂, HC, O₂)  
- Air-Fuel Ratio (AFR)  

These variables simulate real-world engine behaviour and allow the model to learn patterns associated with different fault conditions.  

**Source:**  
Vergara et al. (2023), EngineFaultDB dataset (open-source engine fault simulation dataset)

---

## Model Validation and Refinement  

During model development, one key issue emerged.  
Class 2 and Class 3 faults were not easily separable due to overlapping feature patterns.

To test a potential improvement, I merged both classes into a single “Fault 2” category.  
This resulted in an almost perfect model score.

<img width="515" height="455" alt="image" src="https://github.com/user-attachments/assets/5681ad58-eff8-43a7-8123-72f0d9d73f0e" />


While this appeared to be an improvement, it raised concerns about whether the model was genuinely learning meaningful patterns.

---

## Validation Approach  

To verify the reliability of the model, I conducted additional validation:

- Shuffle testing  
- Data leakage checks  
- Dependency analysis  
- Overfitting checks  

The results showed no clear leakage or overfitting. However, the model exhibited strong data dependency.

<img width="555" height="273" alt="image" src="https://github.com/user-attachments/assets/c8da1246-d20a-46e1-b0eb-6aebc3bc7ccc" />


This meant the model was learning patterns specific to the dataset rather than generalisable relationships.  
As a result, the near-perfect score would likely fail in real-world deployment.

---

## Pipeline Redesign  

To address this, I redesigned the modelling pipeline:

- Removed feature engineering to reduce artificial signal inflation  
- Applied Principal Component Analysis (PCA) to reduce dimensionality and multicollinearity:  
<img width="846" height="547" alt="image" src="https://github.com/user-attachments/assets/7343bb05-ea30-4cf7-99e3-6b4278c8f70b" />

- Introduced K-Means clustering to group similar observations:  
<img width="584" height="97" alt="image" src="https://github.com/user-attachments/assets/06da1f26-8407-42a0-ba09-4b24f744429d" />


This approach prioritised generalisation and robustness over raw accuracy.

---

## Results  

After implementing the redesigned pipeline:

- Shuffle test score dropped to 0.27  
- Model performance became more realistic  
- Generalisation improved significantly  
- Feature space became more interpretable  

<img width="552" height="279" alt="image" src="https://github.com/user-attachments/assets/6e24573f-2af0-4ac1-91a1-341b2552abdb" />
<img width="389" height="169" alt="image" src="https://github.com/user-attachments/assets/f48ca77b-5c5a-48e5-905d-77208574a1bb" />

This reflects a deliberate trade-off from inflated accuracy to reliable real-world performance.

---

## Business Impact  

A model with artificially high accuracy can create false confidence and lead to poor decisions.

Potential risks of the initial model:
- Missed faults leading to higher repair costs and safety risks  
- False positives leading to unnecessary maintenance  
- Reduced trust in the system  

The improved model enables:
- More reliable fault detection  
- Proactive maintenance planning  
- Reduced downtime and operational costs  
- Better scalability to real-world environments  

<img width="790" height="722" alt="image" src="https://github.com/user-attachments/assets/ca6ff792-e109-4cfc-9f34-d3748d7cf515" />


This supports the transition from reactive to predictive maintenance.

---

## Key Takeaways  

This project demonstrates a practical approach to building production-ready models:

- Validating results beyond accuracy  
- Identifying and addressing data dependency  
- Redesigning pipelines when necessary  
- Connecting technical improvements to business outcomes  

The focus is not just on building models, but ensuring they are robust, interpretable, and reliable in real-world applications.
