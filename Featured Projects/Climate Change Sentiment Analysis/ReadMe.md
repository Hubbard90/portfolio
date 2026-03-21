# Twitter Sentiment & Topic Analysis on Clean Energy (SDG 7)

## Project Overview
This project applies Natural Language Processing (NLP) techniques to analyze public sentiment and emerging topics related to Sustainable Development Goal 7 (Affordable and Clean Energy) using Twitter data.

The objective is to transform large-scale, unstructured social media data into actionable insights, demonstrating how analytics can support energy policy, planning, and decision-making — aligning closely with real-world applications in organisations such as energy market operators.

---

## Key Objectives
- Extract meaningful insights from large-scale tweet data  
- Identify key themes and discussions in clean energy  
- Analyze public sentiment trends over time  
- Apply machine learning and NLP techniques for real-world problem solving  

---

## Methods Used

### 1. N-gram Analysis (Phrase Detection)
Unlike single-word frequency, N-grams capture contextual meaning through phrases.

- Bigrams (2-word phrases) and Trigrams (3-word phrases) were extracted  
- Stop words were removed to improve relevance  
- Trigrams were simplified into bigrams where necessary to reduce duplication  

#### Key Insights:
- Dominant themes:
  - EV Charging  
  - Battery Storage  
  - Clean Cooking  
- Strong focus on:
  - Sustainable energy access  
  - Rural electrification (e.g. Kenya projects)

<img width="768" height="589" alt="image" src="https://github.com/user-attachments/assets/b68eba15-e365-4dda-8447-2b9b6ebbbe53" />   
<img width="705" height="636" alt="image" src="https://github.com/user-attachments/assets/8c524307-7c7a-4d22-88cf-bc1690a3bc03" />  


---

### 2. Tweet Volume Over Time (Time Series Analysis)
Tweet frequency was aggregated daily to identify spikes in public discussion.

#### Key Insights:
- Significant spike in April 2025  
- Peak: 410 tweets on April 22  
- Likely driven by:
  - climate-related events  
  - discussions on rural electrification challenges  

<img width="740" height="446" alt="image" src="https://github.com/user-attachments/assets/0699038a-66db-4865-9def-3ed60a595954" />  


---

### 3. Sentiment Analysis (VADER Model)
Each tweet was assigned a sentiment score ranging from -1 (negative) to +1 (positive).

- Used VADER lexicon-based sentiment analysis  
- Aggregated daily to observe sentiment trends  

#### Key Insights:
- High volatility from late 2024 to early 2025  
- Mix of positive and negative spikes linked to:
  - energy announcements  
  - sustainability events  
- Stabilization observed by mid-2025  

<img width="839" height="414" alt="image" src="https://github.com/user-attachments/assets/f3058257-e627-4941-b6d3-e15ef9c43e2c" />  


---

### 4. Topic Modelling (LDA + TF-IDF)
Latent Dirichlet Allocation (LDA) was used to extract hidden themes in the dataset.

- Text tokenized and converted into a dictionary  
- Applied TF-IDF weighting to identify important terms  
- Generated 10 distinct topics  

#### Key Insights:
- Major themes included:
  - rural electrification  
  - infrastructure projects  
  - energy accessibility  
- Topics were clearly separated, ensuring interpretability  

<img width="1035" height="588" alt="image" src="https://github.com/user-attachments/assets/fe21a66e-fd4a-43ec-9d6d-2ed8bdda4beb" />  


---

### 5. Generative AI Integration
To enhance interpretability:

- ChatGPT API was used to:
  - assign topic names  
  - generate descriptions automatically  

#### Value Added:
- Reduced manual interpretation time  
- Improved accessibility for non-technical stakeholders  
- Enabled faster insight generation for decision-making  

<img width="1035" height="92" alt="image" src="https://github.com/user-attachments/assets/dbde1052-3f2e-44f7-9333-1543721ab45b" />  


---

## Business & Industry Relevance

This project demonstrates how analytics can support energy system decision-making, particularly relevant to organisations like the Australian Energy Market Operator:

- Demand & Trend Analysis  
  Understand public interest in energy technologies (EVs, storage, access)

- Energy Transition Insights  
  Identify challenges in renewable adoption and infrastructure gaps  

- Policy & Planning Support  
  Provide data-driven insights for:
  - rural electrification  
  - sustainability initiatives  
  - infrastructure investment  

- Forecasting Potential  
  Similar methods can be applied to:
  - electricity demand forecasting  
  - renewable generation trends  
  - market sentiment analysis  

---

## Key Takeaways
- Public discourse around clean energy is event-driven  
- Strong global focus on energy access and infrastructure  
- Sentiment fluctuates with real-world sustainability events  
- NLP and AI can significantly improve decision-making efficiency  

---

## Tools & Technologies
- Python  
- Pandas, NumPy  
- NLTK, VADER  
- Scikit-learn  
- Gensim (LDA)  
- pyLDAvis  
- OpenAI API (for topic labeling)  
