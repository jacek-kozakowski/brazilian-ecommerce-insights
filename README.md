# Brazilian E-commerce Insights and Segmentation

This project analyzes customer behavior and satisfaction in a large Brazilian e-commerce dataset.  
The analysis covers data preparation, exploratory analysis, review score modeling, market basket analysis, and customer segmentation.
I also included SQL scripts for creating the database and populating it with data as well as UML diagrams in SVG and PDF format.

## Dataset Description

The dataset includes multiple relational tables:
- Orders, Customers, Products, Order Items
- Order Payments, Order Reviews, Sellers
- Geolocation and Product Category Translations

Data is stored in SQLite and accessed via SQL queries within Python using `pandas`.

## Project Overview

### 1. Data Collection and Wrangling
- Loaded original CSVs into SQLite
- Normalized into relational schema with foreign key constraints
- Cleaned and filtered missing/inconsistent data
- Created helper columns such as `has_comment`

### 2. Exploratory Data Analysis
- Identified top-selling product categories
- Visualized monthly sales trends for top categories
- Mapped geographic distribution of seller revenue
- Analyzed review score distribution and patterns

### 3. Market Basket Analysis
- Applied one-hot encoding on product categories by order
- Used the Apriori algorithm to identify frequent itemsets
- Filtered association rules by confidence and lift
- Visualized strongest product co-occurrence rules in a network graph

### 4. Review Score Prediction
- Modeled `review_score` as a multiclass classification problem
- Built baseline model using Random Forest Classifier
- Evaluated using accuracy, precision, recall, and f1-score
- Highlighted strong bias toward 5-star reviews due to class imbalance

### 5. RFM Segmentation
- Calculated Recency, Frequency, and Monetary value for each customer
- Ranked customers and assigned RFM scores (e.g., 444, 111)
- Compared segment behaviors and visualized score distributions
- Generated insights for customer targeting and retention

## Key Insights

- Majority of customers give 5-star reviews; neutral/negative reviews are rare
- Product categories like `bed_bath_table` and `health_beauty` show consistent demand
- Review prediction models favor the dominant class due to imbalance
- RFM analysis reveals high-value customers who purchase frequently and recently

## Tools Used

- Python, SQLite, pandas, seaborn, matplotlib
- `mlxtend` for Apriori algorithm and association rules
- `folium` for map visualizations

## Notebook

All code and analysis is included in the notebook:  
`BrazilianEcommerce.ipynb`

## How to run

1. Clone the repository and install dependencies:

```bash
git clone https://github.com/jacek-kozakowski/brazilian-ecommerce-insights.git
cd brazilian-ecommerce-insights
pip install -r requirements.txt
```
2. Navigate to project directory and open the notebook:

```bash
jupyter notebook BrazilianEcommerce.ipynb
```

## Author

**Jacek Kozakowski** – [LinkedIn][https://www.linkedin.com/in/jacek-kozakowski-31b759356/]
