CREATE TABLE UserLoginDetails (
    UserID int,
    UserName varchar(255),
    Password varchar(255)
);

CREATE TABLE UserLoanDetails (
    UserName varchar(255),loanName varchar(255),loanAppNo int,
    loanAmt double,loanAppDate varchar(255),businessStructure varchar(255),billingIndicator varchar(255),
    taxIndicator varchar(255),contactAddress varchar(255),mobile varchar(255),email varchar(255));

CREATE DATABASE `elogin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;


INSERT INTO UserLoginDetails (UserID, UserName, Password)
VALUES ('1', 'admin', 'admin');
INSERT INTO UserLoginDetails(UserID, UserName, Password) VALUES('1', 'navikngm6058@gmail.com', 'navikngm6058@gmail.com');
INSERT INTO UserLoanDetails(UserName, loanName, loanAppNo,loanAmt,loanAppDate,businessStructure,
billingIndicator,taxIndicator,contactAddress,mobile,email)VALUES
('test1','Personal Loan','37263','2500.00','8 Nov, 2020 4:35:56 PM','Individual','Salaried',
'Yes','test1','9908976532','test@gmail.com');

ALTER TABLE UserLoanDetails
ADD LoanStatus varchar(255);
