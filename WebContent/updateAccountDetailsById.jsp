<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Account details</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link href="mystyle.css" rel="stylesheet">
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
                    <li><a href="deleteaccount.html">Delete Account</a></li>
                    <li><a href="getAllBankAccount.do">Display All BankAccount Details</a></li>
                      <li><a href="updateAccountDetails.html">Edit and Update</a></li>
                      
                  </ul>
                </div>
              </nav>
              <div class="container">
               <form action ="updateAccountDetails.do" method ="post">
              <div class="form-row">
               <div class="col-md-6">
                          <label for="validationTooltip01">Account Id</label>
                          <input type="number" name ="account_id" value = "${accounts.accountId}" class="form-control" id="validationTooltip01" readonly >
                          <div class="valid-tooltip">
                          </div>
                        </div>
                        <div class="col-md-6">
                          <label for="validationTooltip01">Account Holder Name</label>
                          <input type="text" name="customer_name" value = "${accounts.accountHolderName}" class="form-control" id="validationTooltip01"  >
                          <div class="valid-tooltip">
                          </div>
                        </div><br><br><br><br>
                        <div class="col-md-6">
                        <label>Account Type</label>
                         <select name="account_type" name = "account_type" value="${accounts.accountType}" >
                         		<option>--Select--</option>
								<option value="savings">SAVINGS</option>
								<option value="current">CURRENT</option>
								</select>
                          <div class="valid-tooltip">
                          </div>
                        </div>
                        <div class="col-md-6">
                          <label for="validationTooltip01">Account Balance</label>
                          <input type="text" name = "account_balance"value = "${accounts.accountBalance}" class="form-control" id="validationTooltip01"  readonly>
                          <div class="valid-tooltip">
                          </div>
                        </div>
                          <div class="form-row col-md-12 mymargin">
                                        <button type="submit" class="btn btn-primary">Update My Account</button>
                                        </div>
                                          </div>
                        </form>
                        </div>
                        



</body>
</html>