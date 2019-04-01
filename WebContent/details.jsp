<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Account details</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
       <link rel="stylesheet" href="css/mystyle.css" >
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
</head>
<body class="bgimage">
         <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                  <div class="navbar-header">
                    <a class="navbar-brand" href="index.html"><b>DENA BANK</b></a>
                  </div>
                  <ul class="nav navbar-nav">
                    <li class="active"><a href="addNewBankAccount.do">New Account</a></li>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Transaction <span class="caret"></span></a>
                      <ul class="dropdown-menu">
                        <li><a href="deposit.do">Cash Deposit</a></li>
                        <li><a href="withdraw.do">Cash Withdraw</a></li>
                        <li><a href="fundTransfer.do">Fund Transfer</a></li>
                      </ul>
                    </li>
                    <li><a href="balanceinquiry.html">Balance Inquiry</a></li>
                    <li><a href="deleteBankAccount.do">Delete Account</a></li>
                    <li><a href="getAllBankAccount.do">Display All BankAccount Details</a></li>
                     <li><a href="updateAccountDetails.html">Edit and Update</a></li>
                  </ul>
                </div>
              </nav>

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
     	<c:forEach var="account" items="${accounts}">
     		<tr>
     			<td>${account.accountId}</td>
     			<td>${account.accountHolderName}</td>
     			<td>${account.accountType}</td>
     			<td>${account.accountBalance}</td>
     		</tr>
     	</c:forEach>
    </tbody>
  </table>
</div>

</body>
</html>
