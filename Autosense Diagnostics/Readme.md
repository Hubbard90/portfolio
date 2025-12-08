**Project Overview**  
As of today, reactive maintenance still dominates vehicle servicing. The problem with this is that it leads to avoidable downtime, higher repair costs, and higher emissions. Using AI and analytics, we propose transitioning towards a more proactive way of dealing with car faults by continuously monitoring insights from IoT sensors. The AI will then predict faults based on the readings and design maintenance schedules, repair suggestions, and preventative measures. 

The model aims to classify engine faults from sensor data to recommend maintenance action. It makes use of multiple analytics features, from fault detection, scheduling, cost prediction, and insight delivery, to create value for drivers, fleet managers, and manufacturers. This approach extends the existing EngineFaultDB methodology (Vergara et al., 2023) by developing a new machine learning pipeline that makes use of real-world data. 

The business problem was formulated using a multi-class classification model. The model predicts four classes of engine condition based on continuous readings of manifold pressure, throttle position, RPM, emissions, and fuel consumption. The model’s output will then be fed into a pipeline that involves a series of tasks that support the AI’s initiative of creating maintenance schedules and repair decision-making. For this prototype, class 0 refers to a healthy engine, while the rest refer to the following engine issues:  

<img width="498" height="359" alt="image" src="https://github.com/user-attachments/assets/9893048e-0e98-4f4e-83a6-c4c2ac3e190f" />  


**Dataset**  
The study uses the EngineFaultDB dataset that has 55,999 records and 14 continuous predictors that represent the performance of a C14NE engine. This sensor data was collected under normal conditions and fault-induced conditions in order to include engines with actual faults in their dataset.  

**Preprocessing**  
Missing and duplicate values were first checked, with only duplicate values being present. Physically impossible readings were also removed; these data points were implied to be data entry errors. Features were then scaled using the MinMax method so that all the values of the predictors are in the same range.  

The following features were then engineered for better class separability: 

<img width="599" height="207" alt="image" src="https://github.com/user-attachments/assets/0a3ece63-c4e2-4574-bf22-2d593b2bc7dc" />  

The goal of the study is to find a model that accurately detects engine faults for safety and long-term cost savings. Because it will be dangerous, for both people and the car itself, to drive with faulty car parts, we should avoid false negatives.  

Having a low recall score, which measures true positives relative to the number of false negatives there are, would cause drivers to think that the car is safe enough to use even when there are faults. Not only would this lead to dangerous accidents, but this would also cause more damage to the car, increasing the cost of maintenance in the long run.  

Having a low precision score is the opposite; it measures true positives relative to false positives. Having a low precision score will cause the AI to detect engine faults even when there are none. While this may not seem like a worse outcome compared to a low recall score, this would cause the users to lose trust in the AI. They would then ignore detection and end up turning it off because of how often the AI will incur false positive detections.  

The best metric for this is F1, which provides a balance between the two. The AI needs to
prevent false positives and false negatives equally. 

**Model Selection**  
This dataset was tested on KNN, Neural Network, Random Forest, and XGBoost models, with XGBoost having the best results. See below for the optimal hyperparameters and the evaluation:

<img width="339" height="219" alt="image" src="https://github.com/user-attachments/assets/6ecb722c-69b7-46d2-9375-a18775d8883c" />  

<img width="426" height="195" alt="image" src="https://github.com/user-attachments/assets/6f84e1a2-1902-42dc-abc5-71509336ea93" />  

