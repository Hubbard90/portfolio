**Project Overview**  
The goal of this project was to classify 28×28 grayscale images into 10 clothing categories (e.g., shirts, shoes, bags). I started with a simple dense neural network to establish a baseline, then built a deeper CNN architecture that significantly improved accuracy.  

I applied techniques such as data augmentation, dropout, early stopping, and learning-rate scheduling to reduce overfitting and stabilise training.This project builds and compares several deep-learning models using TensorFlow/Keras to classify clothing images from the Fashion-MNIST dataset. It demonstrates how convolutional neural networks (CNNs) learn spatial patterns, how model performance can be improved through regularisation and optimisation, and how to design a workflow that generalises well to unseen data.

**Modeling Approach**  
1. Baseline Neural Network  
Flatten → Dense(128, ReLU) → Dense(10, Softmax)  
Served as the initial benchmark for comparison.  

2. Convolutional Neural Network  
Multiple Conv2D + MaxPooling layers  
Dropout (0.5) to prevent overfitting  
256-unit dense layer  
One-hot encoded labels  
ImageDataGenerator for augmentation  

3. Optimisation  
Compared Adam and RMSprop  
Used EarlyStopping and ReduceLROnPlateau  
RMSprop + callback-driven learning rate scheduling produced the best performance.  

**Results**  
Model	Test Accuracy  
Baseline Neural Network	~89%  
Improved Neural Network	~90%  
Baseline CNN	~91%  
Optimised CNN (Final Model)	~94%  

The optimised CNN showed strong generalisation and effectively extracted spatial features from the images, outperforming dense-only models by a large margin.

**Business Use Case:**  
This CNN model can support real-world retail and e-commerce operations by automating the classification of clothing images, reducing the time and effort spent on manual product tagging. With strong generalisation and high accuracy, it can help maintain consistent product categorisation across large inventories, improve search and filtering, and strengthen recommendation systems by linking visually similar items, all of which lead to a smoother customer experience and more efficient internal workflows.
