<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
     <link rel="stylesheet" href="css/mystyle.css" >
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
   
    <title>Banking Application</title>
</head>
<body>
        <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                  <div class="navbar-header">
                    <a class="navbar-brand" href="index.html"><b>DENA BANK</b></a>
                  </div>
                  <ul class="nav navbar-nav">
                    <li><a href="newaccount.html">New Account</a></li>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Transaction <span class="caret"></span></a>
                      <ul class="dropdown-menu">
                        <li><a href="cashdeposit.html">Cash Deposit</a></li>
                        <li><a href="cashwithdraw.html">Cash Withdraw</a></li>
                        <li><a href="fundtransfer.html">Fund Transfer</a></li>
                      </ul>
                    </li>
                    <li><a href="balanceinquiry.html">Balance Inquiry</a></li>
                    <li><a href="deleteaccount.html">Delete Account</a></li>
                    <li><a href="accountDetails.html">Account Details</a></li>
                    <li><a href="getAllBankAccount.do">Display All BankAccount Details</a></li>
                      <li><a href="updateAccountDetails.html">Edit and Update</a></li>
                  </ul>
                </div>
              </nav>
<body>
	<div class="container">
  <h2>Bank Account Details: </h2>
             
  <table class="table table-striped">
    <thead>
      <tr>
        <th>AccountId</th>
        <th>Account Holder Name</th>
        <th>Account Type</th>
         <th>Account Balance</th>
      </tr>
    </thead>
    <tbody>
     		<tr>
     			<td>${accounts.accountId}</td>
     			<td>${accounts.accountHolderName}</td>
     			<td>${accounts.accountType}</td>
     			<td>${accounts.accountBalance}</td>
     		</tr>
    </tbody>
  </table>
</div>
</body>
</html>