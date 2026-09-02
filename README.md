# HR Analytics -- End-to-End Data Analytics Project

#     Project Overview      #

This project is an end-to-end **HR Analytics solution** designed to turn
raw HR data into meaningful business insights across the employee
lifecycle.

The project uses **SQL/MySQL for database management and analysis** and
**Power BI, DAX, and Power Query** for data transformation, KPI
development, and interactive dashboarding.

The analysis focuses on three core HR business areas:

-   **Recruitment & Hiring**
-   **Retention & Attrition**
-   **Employee Performance**

The overall goal is to help HR and management understand workforce
trends, identify problem areas, and make data-driven decisions.

 **Data Note:** 2025 data is partial and available only up to August
 2025.

------------------------------------------------------------------------

## 🎯 Business Problems Addressed

### 1. Recruitment & Hiring

A key HR challenge is understanding whether recruitment activity is
translating into successful hiring outcomes.

This analysis addresses questions such as:

-   How many applications were received?
-   How many candidates were hired, rejected, placed on hold, or
    withdrawn?
-   What is the overall hiring rate?
-   How does hiring change year over year?
-   Which departments and positions have higher hiring activity?
-   What is the average interview score?
-   How do applications compare with successful hires?

**Business value:**\
Helps HR evaluate recruitment activity, hiring conversion, and areas
where the recruitment process may require attention.

------------------------------------------------------------------------

### 2. Retention & Attrition

Employee turnover can create workforce instability and increase
recruitment and replacement costs. Understanding where and why employees
leave is therefore important for HR decision-making.

This analysis addresses:

-   What is the current workforce size?
-   How many employees are active?
-   How many employees have exited?
-   What is the attrition rate?
-   Which departments experience higher attrition?
-   What are the major reasons for employee exits?
-   How does attrition change over time?
-   Which tenure periods show higher employee exits?
-   How does attrition vary by gender?

**Business value:**\
Helps HR identify high-attrition areas, understand potential exit
drivers, and identify employee tenure periods that may require stronger
retention initiatives.

------------------------------------------------------------------------

### 3. Employee Performance

Organizations need to understand employee performance to identify high
performers, monitor workforce quality, and support performance
management decisions.

This analysis addresses:

-   How many employees have been reviewed?
-   What is the average performance score?
-   How many employees are high, average, or low performers?
-   How are performance scores distributed?
-   How does average performance change year over year?
-   Which employees demonstrate stronger performance and promotion
    potential?

**Business value:**\
Provides management with a structured view of workforce performance and
supports performance review and talent management decisions.

------------------------------------------------------------------------

## 🗂️ Dataset

The project uses multiple HR datasets representing different parts of
the employee lifecycle.

### Database Tables

  Table         Description
  ------------- -----------------------------------------
  Employees     Employee master information
  Departments   Department information
  Jobs          Job and position information
  Recruitment   Recruitment and hiring information
  Performance   Employee performance records
  Exit          Employee exit and attrition information
  Attendance    Employee attendance records
  Leave         Employee leave information
  Payroll       Employee payroll information
  Training      Employee training information

The database creation and setup script is available in the `Database`
folder.

------------------------------------------------------------------------

## 🛠️ Tools & Technologies

-   **MySQL** -- Database creation, data management, and analysis
-   **SQL** -- Business analysis and data querying
-   **Advanced SQL** -- CTEs, window functions, subqueries, ranking, and
    analytical queries
-   **Power BI** -- Interactive dashboard development
-   **DAX** -- Measures, KPIs, rates, and analytical calculations
-   **Power Query** -- Data cleaning and transformation
-   **Advanced Excel** -- Supporting data analysis and reporting

------------------------------------------------------------------------

## 📊 Power BI Dashboards

The Power BI solution contains four dashboard sections.

### 1. HR Analytics Overview

Provides a high-level entry point to the HR Analytics solution and
navigation to the detailed analytical dashboards.

### 2. Recruitment & Hiring Dashboard

**Key KPIs:**

-   Total Applications
-   Total Hired
-   Total Rejected
-   Hiring Rate
-   Average Interview Score

**Key Analysis:**

-   Hiring Status Distribution
-   Applications vs Hires by Year
-   Hiring Trend by Year
-   Applications and Hiring by Position
-   Year-over-Year Hiring Growth by Department

**Purpose:**\
To monitor recruitment volume, hiring outcomes, hiring trends, and
recruitment performance across departments and positions.

------------------------------------------------------------------------

### 3. Retention & Attrition Dashboard

**Key KPIs:**

-   Workforce
-   Active Staff
-   Total Attrition
-   Attrition Rate

**Key Analysis:**

-   Attrition by Department
-   Attrition by Gender
-   Attrition Reasons
-   Attrition Trend by Year
-   Attrition by Tenure

**Purpose:**\
To identify employee turnover patterns, understand major attrition
reasons, and highlight departments or tenure periods with higher
employee exits.

------------------------------------------------------------------------

### 4. Performance Dashboard

**Key KPIs:**

-   Reviewed Employees
-   Average Performance Score
-   High Performers
-   Average Performers
-   Low Performers

**Key Analysis:**

-   Performance Distribution by Category
-   Performance Category Distribution
-   Performance Score Distribution
-   Average Performance Score by Year
-   Employee Performance Details

**Purpose:**\
To monitor workforce performance, identify high-performing employees,
and understand performance trends over time.

------------------------------------------------------------------------

## 🔎 SQL & Advanced SQL Analysis

The project includes both standard SQL business analysis and an
**Advanced SQL Analysis** section containing 10 business-focused
questions.

The analysis demonstrates practical use of:

-   JOINs
-   GROUP BY
-   Aggregate Functions
-   CASE Statements
-   Subqueries
-   Common Table Expressions (CTEs)
-   Window Functions
-   LAG()
-   Ranking
-   Conditional Aggregation
-   Year-over-Year Analysis

The SQL files are available in:

-   `SQL_Analysis/SQL_Analysis.sql`
-   `Advanced_SQL_Analysis/Advanced_SQL_Analysis.sql`

------------------------------------------------------------------------

## 💡 Key Business Insights

The analysis is designed to reveal actionable patterns rather than only
present raw numbers.

### Recruitment & Hiring

-   Comparing applications with hires helps evaluate recruitment
    conversion.
-   Year-wise hiring analysis highlights changes in recruitment activity
    over time.
-   Department- and position-level analysis helps identify areas with
    higher or lower hiring activity.
-   Interview-score analysis provides an additional view of candidate
    quality.

### Retention & Attrition

-   Department-level attrition analysis highlights areas with higher
    employee turnover.
-   Attrition-reason analysis helps identify the major drivers
    associated with employee exits.
-   Tenure analysis helps identify stages of the employee lifecycle
    where exits are more common.
-   Year-wise attrition analysis helps monitor changes in workforce
    stability over time.

### Employee Performance

-   Performance categorization helps separate high, average, and low
    performers.
-   Score distribution provides a broader view of workforce performance.
-   Year-wise performance analysis helps monitor changes in average
    performance over time.
-   Employee-level performance analysis supports identification of
    stronger performers and potential promotion candidates.

> These insights are based on the analytical framework and dashboard
> outputs; exact numerical findings can be reviewed directly in the
> Power BI dashboard and SQL analysis files.

------------------------------------------------------------------------

## 🗄️ Database & ER Diagram

The project includes an Entity Relationship Diagram showing the
relationships between the HR database tables.

**ER Diagram:**

`Diagrams/ER.Diagram.png`

**Database Setup:**

`Database/HR_Database_Setup.sql`

------------------------------------------------------------------------

## 📁 Project Structure

``` text
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

------------------------------------------------------------------------

## 🖼️ Dashboard Screenshots

Dashboard screenshots are available in the `Dashboards` folder:

-   HR Analytics Dashboard Overview
-   Recruitment & Hiring Dashboard
-   Performance Dashboard
-   Retention & Attrition Dashboard

The complete interactive Power BI report is available as:

`HR_Analytics_Dashboard_BI.pbix`

------------------------------------------------------------------------

## 📌 Project Outcome

This project demonstrates a complete **data analytics workflow**:

**Business Problems → Raw HR Data → Database → SQL Analysis → Data
Transformation → DAX → Power BI Dashboards → Business Insights**

The solution transforms multiple HR datasets into a structured
analytical system that can support:

-   Recruitment decision-making
-   Workforce and attrition analysis
-   Employee retention initiatives
-   Performance management
-   Data-driven HR reporting

------------------------------------------------------------------------

## 🚀 How to Use

1.  Clone or download this repository.
2.  Review the datasets in the `Database` folder.
3.  Review `HR_Database_Setup.sql` to understand the database structure.
4.  Explore the SQL business analysis in `SQL_Analysis`.
5.  Explore the 10 advanced SQL questions in `Advanced_SQL_Analysis`.
6.  View the dashboard screenshots in `Dashboards`.
7.  Open `HR_Analytics_Dashboard_BI.pbix` using Power BI Desktop to
    explore the complete interactive report.

------------------------------------------------------------------------

## 👤 Author

**Vikash Giri**

**Data Analyst**

**Skills:** SQL \| MySQL \| Power BI \| DAX \| Power Query \| Advanced
Excel