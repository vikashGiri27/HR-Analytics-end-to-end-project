# Project Title

# HR Analytics: End-to-End Workforce Insights & Analytics

An end-to-end HR analytics project that transforms multi-domain employee data into actionable insights across the employee lifecycle. The project combines **MySQL, SQL, advanced SQL, Power BI, DAX, and Power Query** to help HR and management monitor recruitment effectiveness, workforce retention, employee attrition, and performance.

The solution is built around three core business areas:

* **Recruitment & Hiring** — understanding recruitment volume, hiring conversion, and hiring trends.
* **Retention & Attrition** — identifying where employees leave, why they leave, and when attrition is highest.
* **Employee Performance** — monitoring workforce performance, identifying high and low performers, and tracking performance trends over time.

> **Data note:** 2025 data is partial and available only through August 2025. Therefore, 2025 trends should not be directly compared with full-year totals from previous years without considering the shorter reporting period.

---

## Business Problem

HR teams generate data across recruitment, employee records, attendance, payroll, performance, training, leave, and employee exits. However, data stored across separate operational areas makes it difficult to answer important workforce questions in one place.

This project addresses the need to understand:

* Whether a high volume of applications is converting into successful hires.
* Which departments and positions experience the greatest hiring activity.
* Where employee attrition is concentrated and what factors are associated with employee exits.
* Which stages of employee tenure experience the highest number of exits.
* How workforce performance is distributed between high, average, and low performers.
* Whether recruitment, attrition, and employee performance are improving or changing over time.

The goal is to move from isolated HR records to a consolidated analytical view that supports more informed workforce planning and decision-making.

---

## Project Objectives

The analysis was designed to:

1. **Measure recruitment effectiveness** by tracking applications, hiring outcomes, hiring rate, interview scores, and hiring trends.
2. **Monitor workforce stability** through active staff, total attrition, attrition rate, departmental exits, exit reasons, and tenure patterns.
3. **Evaluate employee performance** using performance scores, performance categories, employee-level details, and year-over-year trends.
4. **Identify high-impact business patterns** that may require HR attention or further investigation.
5. **Demonstrate an end-to-end analytics workflow** from raw HR datasets and relational database design to SQL analysis and interactive Power BI reporting.

---

# Dataset & Data Model

The project uses multiple HR datasets representing different stages of the employee lifecycle.

| Table         | Business Purpose                                                       |
| ------------- | ---------------------------------------------------------------------- |
| `employees`   | Employee master information and workforce demographics                 |
| `departments` | Department information, budgets, locations, and department heads       |
| `jobs`        | Job titles, grades, and salary ranges                                  |
| `attendance`  | Employee attendance, working hours, overtime, and shifts               |
| `exit_data`   | Employee exit dates, reasons, exit types, and final ratings            |
| `training`    | Employee training activity, providers, costs, and certification status |
| `leave_data`  | Employee leave requests, leave duration, and approval status           |
| `payroll`     | Salary, allowances, bonuses, taxes, deductions, and net salary         |
| `performance` | Employee performance scores, ratings, and promotion recommendations    |
| `recruitment` | Candidate applications, interviews, hiring outcomes, and joining dates |

## Core Data Model

The `employees` table acts as the central employee-level entity.

Key relationships include:

* Employees → Departments
* Employees → Jobs
* Employees → Managers through a self-referencing `Manager_ID`
* Departments → Department Head Employee
* Attendance → Employees
* Exit Data → Employees
* Training → Employees
* Leave Data → Employees
* Payroll → Employees
* Performance → Employees
* Performance Reviewer → Employees
* Recruitment → Departments
* Recruitment Recruiter → Employees

This structure enables workforce analysis across multiple HR functions while maintaining employee-level relationships between operational datasets.

---

# Tools & Technologies

* **MySQL** — Database creation, table design, data loading, and relational data management
* **SQL** — Business analysis and exploratory querying
* **Advanced SQL** — CTEs, window functions, ranking, subqueries, conditional aggregation, and year-over-year analysis
* **Power BI** — Interactive dashboard development and reporting
* **DAX** — KPI and analytical measure development
* **Power Query** — Data transformation and preparation
* **Advanced Excel** — Supporting analysis and reporting

---

# Database Implementation

The project includes a complete MySQL database setup process covering:

* Database creation
* Table creation
* CSV data loading
* Null handling during data import
* Primary key creation
* Foreign key relationships
* Employee self-referencing manager relationships
* Relational joins across HR domains

Examples of data preparation performed during loading include converting blank manager, check-in, check-out, and joining-date values into `NULL`.

The database therefore provides a structured foundation for both standard SQL analysis and advanced analytical queries.

---

# SQL Analysis

The SQL analysis explores business questions across multiple HR domains.

## Employee & Workforce Analysis

Key analysis includes:

* Total employee count
* Employees hired by year
* Top highest-paid employees
* Average salary by education level
* Most experienced employees
* Employee distribution by country

## Attendance Analysis

Key analysis includes:

* Attendance records by attendance status
* Average working hours
* Employees with the highest total overtime
* Average overtime by shift
* Attendance volume by shift

## Department Analysis

Key analysis includes:

* Employee count by department
* Average salary by department
* Total salary expense by department
* Average employee experience by department
* Highest-paid employees within each department

## Payroll Analysis

Key analysis includes:

* Total organizational payroll
* Employees with the highest net salary
* Average net salary by department
* Departments with the highest deductions
* Total basic salary versus total net salary

## Performance Analysis

Key analysis includes:

* Average KPI score by department
* Top-performing employees
* Average KPI score by overall rating

## Attrition & Exit Analysis

Key analysis includes:

* Employee exits by year
* Leading exit reasons
* Employee exits by department
* Average tenure of exited employees
* Employee exits by gender

## Leave Analysis

Key analysis includes:

* Most common leave type
* Average leave duration by leave type
* Leave requests by approval status
* Departments with the highest leave activity
* Employees with the highest total leave days

## Training Analysis

Key analysis includes:

* Total organizational training cost
* Certification status distribution
* Training providers by number of training records

## Job & Compensation Analysis

Key analysis includes:

* Employee distribution by job grade
* Job titles with the highest average salary
* Salary ranges by job grade

## Recruitment Analysis

Key analysis includes:

* Total applications
* Applications by hiring status
* Average interview score by position

---

# Advanced SQL Analysis

The project includes 10 advanced business-focused SQL questions demonstrating analytical SQL techniques.

## Advanced Business Questions

1. Identify employees earning above the average salary of their department.
2. Classify employees into salary bands using `CASE`.
3. Find employees and their corresponding managers using a self-join.
4. Identify the second-highest paid employee in each department.
5. Find employees whose salaries fall within the top 10% of the organization.
6. Identify employees with the highest total overtime within each department.
7. Find employees who have taken more leave days than the average employee leave total.
8. Calculate year-over-year changes in employee exits.
9. Measure hiring success rates for recruiters.
10. Identify experienced high performers who were not recommended for promotion.

## SQL Techniques Demonstrated

The project applies:

* `JOIN`
* `LEFT JOIN`
* `GROUP BY`
* Aggregate functions
* `CASE` statements
* Correlated subqueries
* Nested subqueries
* Common Table Expressions (`CTEs`)
* Window functions
* `DENSE_RANK()`
* `NTILE()`
* `LAG()`
* Conditional aggregation
* Self-joins
* Year-over-year analysis
* Ranking within partitions

The advanced analysis focuses on practical HR questions rather than using SQL techniques only for demonstration purposes.

---

# Power BI Dashboard Structure

The Power BI report contains four pages.

## 1. HR Analytics Overview

The overview page acts as the entry point to the reporting solution and provides navigation to the three detailed HR analysis areas:

* Recruitment & Hiring
* Performance
* Retention & Attrition

This structure separates the HR domains while keeping the overall solution easy to navigate.

---

## 2. Recruitment & Hiring Dashboard

### Key KPIs

| KPI                     |  Value |
| ----------------------- | -----: |
| Total Applications      |  9,000 |
| Total Hired             |  1,919 |
| Total Rejected          |  4,535 |
| Hiring Rate             | 21.32% |
| Average Interview Score |  64.69 |

### Dashboard Analysis

The dashboard includes:

* Hiring Status Distribution
* Applications vs Hires by Year
* Hiring Trend by Year
* Year-over-Year Hiring Growth by Department
* Applications and Hiring by Position

### Filters

* Application Year
* Department
* Hiring Status

---

## 3. Retention & Attrition Dashboard

### Key KPIs

| KPI             | Value |
| --------------- | ----: |
| Workforce       | 3,000 |
| Active Staff    | 2,071 |
| Total Attrition |   929 |
| Attrition Rate  |   31% |

### Dashboard Analysis

The dashboard includes:

* Attrition by Department
* Attrition by Gender
* Primary Reason for Leaving
* Attrition Trend by Year
* Attrition by Tenure in Months

### Filters

* Year
* Department

---

## 4. Performance Dashboard

### Key KPIs

| KPI                       | Value |
| ------------------------- | ----: |
| Reviewed Employees        | 2,501 |
| Average Performance Score | 76.00 |
| High Performers           |   617 |
| Average Performers        | 1,508 |
| Low Performers            |   376 |

### Dashboard Analysis

The dashboard includes:

* Performance Distribution by Category
* Performance Category Distribution
* Performance Score Distribution
* Employee Performance Details
* Average Performance Score by Year

### Filters

* Review Year
* Department
* Performance Category

---

# Key Findings & Business Insights

## 1. Recruitment volume is high, but hiring conversion remains limited

The organization received **9,000 applications**, while **1,919 candidates were hired**, resulting in a **21.32% hiring rate**.

At the same time, **4,535 applications were rejected**, representing **50.39% of the hiring status distribution**.

### Why it matters

A large applicant pool does not automatically translate into successful workforce acquisition. The difference between application volume and successful hires suggests that HR should continue evaluating where candidates are being filtered out and whether recruitment channels are producing candidates aligned with job requirements.

### Recommended action

Review recruitment performance by:

* Department
* Position
* Recruiter
* Hiring status
* Interview outcomes

This can help identify whether low conversion is concentrated in particular hiring areas.

---

## 2. A meaningful portion of recruitment activity remains unresolved or unsuccessful

The hiring status distribution shows:

* **Rejected:** 50.39%
* **Hired:** 21.32%
* **On Hold:** 15.42%
* **Withdrawn:** 12.87%

### Why it matters

More than one outcome category exists beyond successful hiring, and the proportion of candidates placed on hold or withdrawn represents an opportunity to investigate recruitment process delays, candidate experience, or role-specific hiring challenges.

### Recommended action

Monitor the causes behind:

* Candidate withdrawals
* Extended on-hold decisions
* High rejection rates

Process-level analysis can help HR identify whether recruitment inefficiencies are affecting hiring outcomes.

---

## 3. Hiring increased through 2023 before declining

The hiring trend increased from:

* **317 hires in 2020**
* **329 in 2021**
* **343 in 2022**
* **374 in 2023**

Hiring then decreased to **347 in 2024**.

The dashboard shows **162 hires in 2025**, although 2025 is partial-year data.

### Why it matters

The increase through 2023 indicates expanding hiring activity, while the decline in 2024 may indicate changing workforce demand, recruitment conditions, or organizational hiring priorities.

### Recommended action

Investigate the 2024 decline by combining hiring trends with:

* Department-level hiring growth
* Position-level applications and hiring
* Attrition levels
* Workforce demand

---

## 4. Attrition represents a significant workforce stability challenge

The dashboard reports:

* **3,000 total workforce**
* **2,071 active staff**
* **929 employee exits**
* **31% attrition rate**

### Why it matters

A 31% attrition rate represents substantial workforce movement. Employee exits can increase replacement demand and create additional pressure on recruitment, workforce continuity, and departmental capacity.

### Recommended action

Prioritize retention analysis around the areas with the greatest concentration of exits, particularly departments, tenure periods, and exit reasons.

---

## 5. Work-life balance and relocation are the largest reported attrition drivers

The primary reasons for leaving are distributed as follows:

| Exit Reason        | Share of Attrition |
| ------------------ | -----------------: |
| Work-Life Balance  |             28.65% |
| Relocation         |             25.99% |
| Policy Violation   |             16.98% |
| Performance Issues |             14.59% |
| Retirement         |             13.79% |

The two largest categories are **Work-Life Balance** and **Relocation**.

### Why it matters

These two factors account for more than half of the recorded attrition reasons combined. This suggests that workforce flexibility, employee experience, and location-related employment considerations deserve focused attention.

### Recommended action

Consider further investigation into:

* Workload and scheduling patterns
* Flexible work arrangements where applicable
* Location and mobility challenges
* Department-specific work-life balance patterns

---

## 6. IT has the highest departmental attrition count

The attrition-by-department analysis shows the highest number of exits in:

* **IT: 81**

Other departments with relatively high exit counts include:

* **Sales: 44**
* **Human Resources: 43**
* **QA: 43**

### Why it matters

Attrition is not evenly distributed across departments. IT has a substantially higher exit count than the other displayed departments, making it a high-priority area for deeper investigation.

### Recommended action

Conduct targeted analysis of IT attrition using:

* Exit reasons
* Employee tenure
* Compensation
* Overtime
* Attendance
* Performance history

The goal should be to determine whether the department's higher exit volume is associated with identifiable workforce conditions.

---

## 7. Attrition is concentrated among earlier tenure periods

The tenure analysis shows the highest attrition counts at:

* **6 months: 79 exits**
* **12 months: 68 exits**
* **18 months: 64 exits**
* **24 months: 49 exits**

Attrition generally declines across later tenure periods.

### Why it matters

The concentration of exits during earlier employment stages suggests that the employee experience during the first two years is especially important for workforce retention.

### Recommended action

Strengthen early employee retention initiatives through:

* Onboarding support
* Manager engagement
* Early career development
* Regular employee feedback
* Early identification of workload or workplace concerns

---

## 8. Attrition increased sharply before declining in the partial 2025 period

The attrition trend increased from approximately:

* **24 exits in 2021**
* **45 in 2022**
* **78 in 2023**
* **125 in 2024**

The dashboard shows **99 exits in 2025**, but the year is partial.

### Why it matters

The increase leading into 2024 indicates worsening workforce stability over the full-year trend. The partial 2025 value should not be interpreted as a full-year improvement without considering that data is available only through August.

### Recommended action

Continue monitoring attrition on a comparable period basis and investigate what changed between 2023 and 2024, particularly within departments with high exit volumes.

---

## 9. Most reviewed employees are classified as average performers

Among **2,501 reviewed employees**:

* **1,508 are Average Performers (60.3%)**
* **617 are High Performers (24.67%)**
* **376 are Low Performers (15.03%)**

The average performance score is **76.00**.

### Why it matters

The workforce is primarily concentrated in the average performance category. This presents two important opportunities:

1. Retain and develop high performers.
2. Improve the performance of the large average-performing employee population.

### Recommended action

Use employee-level performance analysis to support:

* Development planning
* Targeted coaching
* Promotion discussions
* Performance improvement initiatives

---

## 10. Performance scores are concentrated in the middle-to-upper score ranges

The performance score distribution is most concentrated in the **70–80 score range**, with a smaller concentration in the **80–90 range**.

### Why it matters

The distribution supports the dashboard's overall result that most employees fall into the average performance category, while a smaller group qualifies as high performers.

### Recommended action

Focus performance management on moving capable employees from average performance toward higher performance while identifying the specific support needs of the low-performance population.

---

# Business Recommendations

Based on the dashboard and SQL analysis, the strongest actions for HR leadership are:

### 1. Prioritize retention in high-attrition departments

IT should receive immediate attention because it has the highest displayed attrition count.

### 2. Strengthen early-tenure retention

The highest attrition counts occur during earlier tenure periods, particularly between 6 and 24 months.

### 3. Investigate work-life balance as a leading exit driver

Work-life balance is the largest reported attrition reason and should be examined alongside workload, scheduling, and department-level conditions.

### 4. Improve recruitment conversion monitoring

Track applications, hires, rejections, holds, and withdrawals by department, position, and recruiter to identify areas where recruitment outcomes can improve.

### 5. Investigate the decline in hiring after 2023

Combine recruitment trends with workforce and attrition data to determine whether the decline reflects changing organizational demand or recruitment performance.

### 6. Develop the large average-performing workforce

Since 60.3% of reviewed employees are classified as average performers, targeted development programs could potentially create significant improvement across the organization.

### 7. Protect and retain high performers

Use employee performance details and promotion-related analysis to identify strong performers who may require career development and retention attention.

---

# Project Outcome

This project demonstrates a complete data analytics workflow:

**Raw HR Data → MySQL Database → Data Relationships → SQL Analysis → Advanced SQL Analysis → Data Transformation → DAX & Power BI → Business Insights**

The final solution provides an integrated view of:

* Recruitment performance
* Hiring outcomes
* Workforce composition
* Employee attrition
* Exit reasons
* Department-level workforce patterns
* Employee tenure and retention
* Employee performance
* Compensation and payroll analysis
* Attendance and overtime
* Leave and training activity

The project moves beyond descriptive reporting by connecting workforce patterns to business questions and highlighting areas where HR can take targeted action.

---

# Project Structure

```text
HR-Analytics-end-to-end-project/
│
├── Advanced_SQL_Analysis/
│   └── Advanced_SQL_Analysis.sql
│
├── Dashboards/
│   ├── HR Analytics Dashboard Overview.png
│   ├── Performance Dashboard.png
│   ├── Recruitment & Hiring Dashboard.png
│   └── Retention & Attrition Dashboard.png
│
├── Database/
│   ├── Attendance.csv
│   ├── Departments.csv
│   ├── Employees.csv
│   ├── Exit.csv
│   ├── HR_Database_Setup.sql
│   ├── Jobs.csv
│   ├── Leave.csv
│   ├── Payroll.csv
│   ├── Performance.csv
│   ├── Recruitment.csv
│   └── Training.csv
│
├── Diagrams/
│   └── ER.Diagram.png
│
├── SQL_Analysis/
│   └── SQL_Analysis.sql
│
├── HR_Analytics_Dashboard_BI.pbix
│
└── README.md
```

---

# How to Use

1. Clone or download the repository.
2. Review the datasets in the `Database` folder.
3. Run the database setup script to create the MySQL database and tables.
4. Review the table relationships and foreign key structure.
5. Explore the standard business analysis in `SQL_Analysis`.
6. Explore the advanced analytical questions in `Advanced_SQL_Analysis`.
7. Review the Power BI dashboard screenshots.
8. Open `HR_Analytics_Dashboard_BI.pbix` in Power BI Desktop to interact with the complete report.

---

# Skills Demonstrated

**SQL & Databases**

* Database design
* Data loading
* Primary and foreign keys
* Relational data modeling
* Joins
* Aggregations
* Subqueries
* CTEs
* Window functions
* Ranking
* Conditional aggregation
* Year-over-year analysis

**Business Analytics**

* Recruitment analysis
* Hiring conversion analysis
* Workforce analysis
* Attrition analysis
* Retention analysis
* Performance analysis
* Department-level analysis
* Trend analysis
* KPI development
* Business insight generation

**Business Intelligence**

* Power BI dashboard design
* Interactive filtering
* DAX measures
* Power Query transformations
* KPI reporting
* Data visualization
* Executive-level analytical storytelling

---

# Author

**Vikash Giri**
**Data Analyst**

**Skills:** SQL | MySQL | Power BI | DAX | Power Query | Advanced Excel
