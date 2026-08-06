# AutoSense Diagnostics: Predictive Maintenance System

## Introduction

AutoSense Diagnostics is a conceptual edge-to-cloud AI system designed to detect and classify engine faults using real-time sensor data.

The project explores how vehicle servicing can move away from reactive maintenance, where faults are addressed only after a breakdown, towards predictive maintenance that identifies problems earlier.

By analysing engine pressure, fuel consumption, emissions, throttle position, and RPM, the system can classify engine conditions and support downstream decisions such as:

- Maintenance scheduling
- Repair cost estimation
- Real-time fault alerts
- Vehicle health monitoring

The broader goal is to reduce unplanned downtime, avoid preventable repair costs, and support safer and more efficient vehicle maintenance.

---

## Problem Overview

Reactive maintenance remains common in vehicle servicing. In this approach, repairs are usually performed only after a fault becomes noticeable or a component fails.

This creates several problems:

- Unexpected vehicle downtime
- Higher repair costs
- Increased safety risks
- More severe component damage
- Inefficient maintenance scheduling
- Reduced vehicle availability for fleets

The objective of this project was to develop a machine learning pipeline capable of identifying engine faults before they lead to more serious failures.

The model was designed as a multi-class classification system that predicts different engine conditions from continuous sensor readings.

---

## Dataset

The model was developed using the **EngineFaultDB** dataset, which contains **55,999 engine sensor records** collected under normal and fault-induced operating conditions.

The main variables include:

- Manifold Absolute Pressure (`MAP`)
- Throttle Position Sensor (`TPS`)
- Engine force
- Engine power
- Revolutions Per Minute (`RPM`)
- Fuel consumption
- Vehicle speed
- Carbon monoxide (`CO`)
- Carbon dioxide (`CO2`)
- Hydrocarbons (`HC`)
- Oxygen (`O2`)
- Lambda
- Air-Fuel Ratio (`AFR`)

These variables represent different aspects of engine performance, combustion behaviour, fuel efficiency, and emissions.

**Source:** Vergara et al. (2023), EngineFaultDB.

---

## Approach

### Initial Model Development

Several supervised classification models were evaluated, including:

- K-Nearest Neighbours
- Support Vector Machine
- Neural Network
- XGBoost

XGBoost produced the strongest initial performance because it was able to capture nonlinear relationships across the engine sensor variables.

However, one major issue emerged during development. Fault Classes 2 and 3 had highly overlapping feature patterns and were difficult for the model to distinguish reliably.

<img width="652" height="297" alt="image" src="https://github.com/user-attachments/assets/0e1a6b49-23ae-407e-9a43-233db4cfef8e" />


### Class Merging Experiment

To investigate whether performance could be improved, Classes 2 and 3 were merged into a single fault category.

This produced an almost perfect model score.

<img width="515" height="455" alt="image" src="https://github.com/user-attachments/assets/b0da077a-1233-4d94-befe-c81518cababc" />


Although the result initially appeared promising, the near-perfect performance raised concerns. Scores this high can sometimes indicate that the model is relying on duplicate observations, strong dependencies, or patterns that may not generalise outside the original dataset.

For that reason, additional validation was performed before accepting the result.

---

## Model Validation

The model was tested using several diagnostic approaches:

- Label shuffle testing
- Data leakage checks
- Duplicate and dependency analysis
- Overfitting checks

The results showed no clear leakage or overfitting. However, the model exhibited strong data dependency.
<img width="555" height="273" alt="image" src="https://github.com/user-attachments/assets/ac7a4d09-12b4-4bc3-9b05-c081d041244c" />

However, the shuffle test remained unusually high.

When target labels are shuffled, the relationship between the predictors and target should be broken. A model should then perform close to random guessing. The stronger-than-expected shuffle result suggested that the observations were not fully independent.

The model was likely learning dataset-specific structures, such as highly similar operating conditions or groups of closely related observations, rather than relationships that would reliably generalise to new vehicles.

This meant that the near-perfect score was not a trustworthy representation of likely real-world performance.

In order to counteract this, K-means grouping was performed. I clustered the data points into 80 clustered rows using K-means method, so the model learns from the 80 clusters instead of each and every data point. Another shuffle test with a macro-F1 score of 0.27 revealed that the clustering helped reduce it to a negligible amount.

<img width="652" height="326" alt="image" src="https://github.com/user-attachments/assets/12378ebd-b672-4d5e-8926-62f7850da55d" />

---

## Pipeline Redesign

To reduce dependency and produce a more credible evaluation, the modelling pipeline was redesigned.

### Feature Review

Some engineered variables were removed because they appeared to strengthen patterns that were already present in the original variables.

While feature engineering can improve performance, it can also amplify dataset-specific relationships. Removing these features helped determine whether the model could learn directly from the original sensor measurements.

### Principal Component Analysis

Principal Component Analysis was applied to reduce dimensionality and control multicollinearity between the sensor variables.

<img width="1035" height="669" alt="image" src="https://github.com/user-attachments/assets/f22d542b-b1f3-46fc-bada-cf76635b175b" />

The first four principal components retained approximately **83.4% of the total variance**.

This reduced redundancy while preserving most of the information contained in the original sensor readings.

### Group-Based Validation

The redesigned pipeline used grouped validation rather than relying only on a standard random train-test split.

This reduced the likelihood that near-duplicate or closely related sensor readings would appear in both datasets.

The revised approach prioritised:

- Generalisation
- Independence between training and testing data
- More realistic model evaluation
- Reduced dependency on dataset-specific patterns

---

## Results

After redesigning the pipeline:

- The label shuffle macro F1 score dropped to approximately **0.27**
- Model performance became more realistic
- The gap between genuine and shuffled-label performance became clearer
- Dependency between training and testing observations was reduced
- Cross-validation produced more credible estimates of generalisation

<img width="462" height="197" alt="image" src="https://github.com/user-attachments/assets/20ea89fe-a1e3-4575-8d29-8f76f9d8a7f0" />


The final model achieved a cross-validation macro F1 score of approximately:

```text
0.855 ± 0.041
