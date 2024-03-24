show tables;
SHOW TABLES FROM `bank analytics`;
-- Question 1
SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(CONCAT('01-', issue_d), '%d-%b-%y')) AS loan_year,
    COUNT(*) AS number_of_loans,
    SUM(loan_amnt) AS total_loan_amount,
    AVG(loan_amnt) AS average_loan_amount,
    MIN(loan_amnt) AS min_loan_amount,
    MAX(loan_amnt) AS max_loan_amount
FROM 
    finance_1
WHERE 
    issue_d IS NOT NULL
GROUP BY 
    loan_year
ORDER BY 
    loan_year
LIMIT 0, 1000;

-- Question 2

SELECT 
    f1.grade,
    f1.sub_grade,
    SUM(f2.revol_bal) AS total_revol_bal
FROM 
    finance_1 f1
JOIN 
    finance_2 f2 ON f1.id = f2.id
GROUP BY 
    f1.grade, f1.sub_grade
ORDER BY 
    f1.grade, f1.sub_grade;
    
    -- Question 3
SELECT 
    f1.verification_status,
    SUM(f2.total_pymnt) AS total_payment
FROM 
    finance_1 f1
JOIN 
    finance_2 f2 ON f1.id = f2.id
GROUP BY 
    f1.verification_status;
    
    -- Question 4
    SELECT 
    f1.addr_state,
    f2.last_credit_pull_d,
    f1.loan_status,
    COUNT(*) AS loan_count
FROM 
    finance_1 f1
JOIN 
    finance_2 f2 ON f1.id = f2.id
GROUP BY 
    f1.addr_state, f2.last_credit_pull_d, f1.loan_status;
    
    -- Question 5
SELECT 
    f1.home_ownership,
    f2.last_pymnt_d,
    COUNT(*) AS loan_count
FROM 
    finance_1 f1
JOIN 
    finance_2 f2 ON f1.id = f2.id 
GROUP BY 
    f1.home_ownership, f2.last_pymnt_d;









