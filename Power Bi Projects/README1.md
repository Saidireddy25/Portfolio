# 🛍️ Retail Sales Power BI Dashboard

## 📊 Overview

This Power BI dashboard is designed to provide a detailed visual analysis of retail sales performance across multiple dimensions such as cart value segmentation, discounting patterns, delivery logistics, and yearly trends. The insights derived aim to help business stakeholders make informed decisions to drive revenue growth, optimize shipping strategies, and enhance customer satisfaction.
![Retailsalesdashboard](https://github.com/user-attachments/assets/66ecb754-41c2-4948-b8fc-7f254bd74093)  

### 🎯 Purpose
- To visualize sales data for better decision-making.
- Identify patterns in cart value and discounting strategies.
- Understand the impact of shipping modes on delivery times.
- Evaluate year-over-year sales trends to assess business growth.

### 🧾 Scope
- Sales data spanning from 2014 to 2018.
- Performance metrics by cart value category.
- Delivery time by shipping modes.
- Discounted sales and their impact on total revenue.

### 👥 Target Stakeholders
- Business Executives & Managers
- Sales & Marketing Teams
- Logistics and Operations Managers
- Financial Analysts

---

## 📌 Dashboard Highlights

### 1. **Total Sales**
- 💰 **Total Revenue:** `2.33M`
- Represents the complete value of sales transactions across all product types and time periods.
![Total sales](https://github.com/user-attachments/assets/ee020865-86fb-4460-a581-0b5cc259f7ba)

### 2. **Cart Value Distribution**
- 🧺 **Low:** `1.28M` (54.7%)
- 🧺 **Medium:** `0.68M` (29.31%)
- 🧺 **High:** `0.24M` (10.13%)
- 🧺 **Very High:** `0.14M` (5.86%)
- 📍 **Insight:** Majority of sales (55%) come from low cart value purchases — indicates high transaction volume but potentially lower profit margins.

![Cart Value Chart](https://github.com/user-attachments/assets/ca7ebdf2-fea5-4756-92e3-420e9ee72cac)

### 3. **Sales from Low Cart + High Discount**
- 🔻 **Value:** `14.11K`
- 📍 Indicates potential revenue leakage due to aggressive discounting on low-value orders. This combination is not sustainable long-term.

### 4. **Discounted Product Sales**
- 💸 **Total:** `923K`
- 40% of total sales involve discounts — a red flag for over-reliance on price reductions to boost sales.

### 5. **Average Delivery Time by Ship Mode**
| Shipping Mode      | Avg. Delivery Time (days) |
|--------------------|---------------------------|
| Standard Class     | 5.00                      |
| Second Class       | 3.23                      |
| First Class        | 2.19                      |
| Same Day           | 0.05                      |
- 🚛 **Insight:** Same Day delivery is extremely fast but likely more costly. Standard Class is significantly slower — may lead to poor customer experience if not handled strategically.
![Average delivert time](https://github.com/user-attachments/assets/7329b6f1-0c40-462f-a4aa-8bde870b0e1e)
### 6. **Cumulative Sales by Year**
| Year | Sales          |
|------|----------------|
| 2014 | 936,662        |
| 2015 | 1,016,669      |
| 2016 | 1,622,352      |
| 2017 | 2,485,560      |
- 📈 **Observation:** Sales show a healthy upward trend up to 2017, signaling good growth and customer acquisition.

![Cumulative Sales](https://github.com/user-attachments/assets/ced051e2-9e9b-48c1-8866-95b9c0a0c5ef)
### 7. **Year-over-Year (YoY) Sales Growth**
- 🔄 Sales growth increased until 2017, then dropped sharply in 2018.
- ⚠️ **Warning:** Indicates declining momentum — possibly due to market saturation, pricing strategy inefficiencies, or operational bottlenecks.

---

## 🧠 Business Insights & Decisions

### 1. 💵 Discount Strategy Optimization
- ✅ Introduce **discount thresholds** to prevent over-discounting low-value orders.
- ✅ Focus on **retention marketing** to target high cart customers with personalized offers.

### 2. 🚚 Shipping Efficiency
- ✅ Offer **free shipping upgrades** for premium customers to increase retention.
- ✅ Shift more transactions to faster shipping modes where feasible to reduce delivery complaints.

### 3. 📉 Revive Sales Growth
- ✅ Launch **new customer loyalty programs** to encourage repeat purchases.
- ✅ Introduce **product bundling strategies** to increase average cart value.

### 4. 📦 Improve Cart Value Mix
- ✅ Segment users and promote **upselling tactics** for medium and high cart brackets.
- ✅ Use email/ads to educate customers on savings through bundling for higher value.

---

## 📈 Future Enhancements

- Add RFM (Recency, Frequency, Monetary) segmentation for deeper customer analysis.
- Integrate profitability metrics by region or product category.
- Include customer satisfaction and returns data for a 360-degree view.
- Add trendlines or forecasting components for predictive analytics.

---

## 🛠️ Tools Used

- **Power BI:** Data modeling & dashboard creation
- **DAX:** Calculations and KPIs
- **Excel / CSV / SQL:** Assumed data source
- **GitHub:** Version control and documentation

---

## 🗃️ Dataset Columns

- `Order_ID`
- `Order_Date`
- `Cart_Value`
- `Discount_Applied`
- `Sales_Amount`
- `Ship_Mode`
- `Delivery_Time`
- `Year`

---

## 🧾 How to Use

1. Clone or download this report.
2. Open the `Retailsalesdashboard.pbix`  attached file in Power BI Desktop.
3. Refresh the data source to reflect the latest inputs.
4. Use slicers and filters to explore the sales data interactively.

---

## 🧠 Final Thoughts

This dashboard equips stakeholders with actionable insights by bringing clarity to complex sales dynamics. It supports data-driven decision-making across pricing, logistics, and marketing operations. With its visual storytelling, teams can collaborate more effectively on key performance improvements.

---

## 👨‍💻 Author

**Saidireddy Karnati**  
📍 Data Analyst  
📧 [LinkedIn](https://www.linkedin.com/in/saidireddy25)  
🎯 Passionate about turning raw data into actionable insights.

📧 Email: saidireddyoffice@gmail.com 

---


## 💬 Feedback & Contributions  
If you have any suggestions or insights, feel free to raise an issue or contribute! Looking forward to learning from the community.  

---









---
