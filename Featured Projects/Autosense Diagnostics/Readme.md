# Engine Fault Classification for Predictive Maintenance  
## Translating Machine Learning into Business Impact

## Overview
This project develops a machine learning model to classify engine fault conditions using sensor data. The broader objective is to support a shift from reactive maintenance to **predictive, data-driven decision-making** in the automotive industry.

The work builds on the Auto-sense Diagnostics (ASD) concept, an edge-to-cloud predictive maintenance system designed to monitor vehicle health using IoT sensor data and machine learning models :contentReference[oaicite:0]{index=0}.

The final model achieved:

- Mean Cross-Validation Macro-F1: **0.855 ± 0.041**
- <img width="508" height="445" alt="image" src="https://github.com/user-attachments/assets/857a2a25-c8f4-4d69-8469-6d201b5d526d" />
- Strong generalisation across engine condition groups
- Reliable detection of dominant fault patterns

---

## Business Problem Context
Reactive vehicle maintenance remains the dominant approach in the industry, leading to:

- Unplanned downtime  
- Higher repair costs  
- Increased emissions  

According to the project report, unplanned vehicle downtime results in significant economic loss and inefficiencies, highlighting the need for proactive solutions :contentReference[oaicite:1]{index=1}.

This project reframes the problem as:

> How can engine faults be detected early using sensor data to reduce downtime, optimise maintenance, and improve operational efficiency?

---

## Data and Model Approach

The model uses the EngineFaultDB dataset, consisting of:

- ~56,000 observations  
- 14 continuous engine sensor variables  
- Measurements including RPM, throttle position, emissions, fuel consumption, and air-fuel ratios 

A multi-class classification approach was used to predict engine health states.

Key modelling steps:
- Data preprocessing and scaling
- Feature engineering and transformation
- KMeans-based grouping to handle structured similarity
- GroupKFold cross-validation for robust evaluation
- XGBoost selected as the final model due to strong performance on non-linear data

---

## Key Analytical Insights

### 1. Engine faults are driven by consistent system behaviour
The model performs consistently across cross-validation folds, indicating that:

- Faults are not random  
- They are driven by repeatable relationships between engine variables  

Business implication:
- Engine monitoring can be standardised across vehicles
- Enables scalable predictive maintenance systems

---

### 2. Fault detection difficulty varies across conditions
The original study showed that some fault classes are significantly harder to distinguish due to overlapping feature space.

This is also reflected in model variability across folds.

Business implication:
- Diagnostic systems should prioritise ambiguous or borderline fault conditions
- Resource allocation (inspection, servicing) can be optimised

---

### 3. Model performance depends on operating conditions
Cross-validation results varied:

- Macro-F1 range: ~0.82 to ~0.93
-   <img width="292" height="130" alt="image" src="https://github.com/user-attachments/assets/ed0d2acd-afb8-4373-ab54-de20d7f7e1aa" />

This indicates that model performance changes depending on which engine conditions are encountered.

Business implication:
- Models must be validated across diverse operating environments
- Deployment should include continuous monitoring and retraining

---

### 4. High model accuracy can be misleading without validation
Initial experiments showed near-perfect performance (~0.99), but deeper validation revealed:

- Dataset contains structured and predictable patterns  
- Performance can be inflated without proper validation  

Business implication:
- High accuracy alone is not sufficient  
- Robust validation (e.g. grouped cross-validation) is critical for real-world deployment

---

### 5. Feature engineering must balance performance and generalisability
Some engineered features significantly improved performance but risked encoding fault logic directly.

Business implication:
- Over-engineered features can reduce model reliability in real-world scenarios  
- Simpler, more generalisable features are often more robust

---

## Business Value

### Predictive Maintenance
- Early detection of faults before failure  
- Reduced vehicle downtime  
- Improved safety outcomes  

---

### Cost Optimisation
- Prevent expensive repairs  
- Reduce unnecessary servicing  
- Enable cost forecasting through integrated analytics  

---

### Operational Efficiency
- Real-time monitoring via IoT sensors  
- Faster diagnosis compared to manual inspection  
- Scalable deployment across fleets  

---

### Strategic Insights
- Identify recurring fault patterns  
- Support product design improvements  
- Enable data-driven decision-making for fleet managers and manufacturers  

---

## Deployment Context

The model is designed as part of the Auto-sense Diagnostics system:

- IoT sensors collect real-time engine data  
- Data is processed through an edge-to-cloud architecture  
- Model outputs include:
  - fault classification  
  - maintenance recommendations  
  - cost predictions  
  - analytics dashboards  

This transforms the model from a standalone classifier into a **decision-support system** :contentReference[oaicite:4]{index=4}.

---

## Limitations

- Dataset is collected under controlled conditions  
- Real-world data will include:
  - noise  
  - missing values  
  - unpredictable behaviour  

- Some fault classes remain difficult to separate due to overlapping features  

This suggests that real-world performance may be lower than observed results.

---

## Future Improvements

- Incorporate real-world sensor data  
- Extend model to time-series predictions  
- Improve class separation using additional data  
- Expand to multi-system diagnostics (e.g. transmission, fuel system)  
- Implement continuous learning via MLOps pipeline  

---

## Key Takeaway

This project demonstrates that:

- Strong predictive performance must be supported by robust validation  
- Machine learning models create the most value when integrated into business workflows  
- Predictive maintenance systems can significantly improve operational efficiency, reduce costs, and enhance decision-making  

---

## About

This project focuses on bridging technical modelling with business value, demonstrating how machine learning can be applied to real-world operational problems in a practical and scalable way.
