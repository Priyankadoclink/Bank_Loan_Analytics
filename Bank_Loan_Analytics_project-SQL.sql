create database Bank_loan_project;
use bank_loan_project;
Select * from finance_1;
Select * from finance_2;

/*
1. Year wise loan amount Stats
2.Grade and sub grade wise revol_bal
3.Total Payment for Verified Status Vs Total Payment for Non Verified Status
4.State wise and month wise loan status
5.Home ownership Vs last payment date stats
*/

# KPI-1 (Year wise loan amount Stats)
select Year (issue_d) as Year,concat("$ ",format(round(sum(loan_amnt)/1000000,2),2),"M") as Total_loan_amount 
from finance_1
group by Year
order by Year;

# KPI-2 (Grade and sub grade wise revol_bal)

select grade, sub_grade, sum(revol_bal) as Total_revol_bal
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by grade, sub_grade
order by grade, sub_grade;

# KPI-3 (Total Payment for Verified Status Vs Total Payment for Non Verified Status)

select verification_status, concat("$",format(round(sum(total_pymnt)/1000000,2),2),"M") as Total_Payment
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by verification_status
order by verification_status;

# KPI-4 (State wise and month wise loan status)

select addr_state, last_credit_pull_d, loan_status
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by addr_state, last_credit_pull_d, loan_status
order by last_credit_pull_d;

#KPI-5 (Home ownership Vs last payment date stats)

select home_ownership, last_pymnt_d
#concat("$",format(round(sum(last_pymnt_amnt)/10000,2),2), "K") as total_amnt
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by home_ownership, last_pymnt_d
order by home_ownership desc, last_pymnt_d desc;



