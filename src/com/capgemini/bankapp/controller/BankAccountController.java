package com.capgemini.bankapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.capgemini.bankapp.exception.BankAccountNotFoundException;
import com.capgemini.bankapp.exception.LowBalanceException;
import com.capgemini.bankapp.model.BankAccount;
import com.capgemini.bankapp.service.BankAccountService;
import com.capgemini.bankapp.service.impl.BankAccountServiceImpl;

@WebServlet(urlPatterns = { "*.do" }, loadOnStartup = 1)
public class BankAccountController extends HttpServlet {
	static final Logger logger = Logger.getLogger(BankAccountController.class);
	private static final long serialVersionUID = 1L;

	private BankAccountService bankService;

	public BankAccountController() {
		bankService = new BankAccountServiceImpl();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		String path = request.getServletPath();

		if (path.equals("/getAllBankAccount.do")) {
			List<BankAccount> bankAccounts = bankService.findAllBankAccounts();
			RequestDispatcher dispatcher = request.getRequestDispatcher("details.jsp");
			request.setAttribute("accounts", bankAccounts);
			dispatcher.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String path = request.getServletPath();
		System.out.println(path);

		if (path.equals("/addNewBankAccount.do")) {
			String accountHolderName = request.getParameter("customer_name");
			String accountType = request.getParameter("account_type");
			double balance = Double.parseDouble(request.getParameter("account_balance"));

			BankAccount account = new BankAccount(accountHolderName, accountType, balance);
			if (bankService.addNewBankAccount(account)) {
				out.println("<h2>BankAccount created Successfully...");
				out.println("<h2><a href = 'index.html'>|Home|</h2>");
				out.close();
			}

		}

		if (path.equals("/deleteBankAccount.do")) {
			long accountId = Long.parseLong(request.getParameter("account_id"));

			try {
				if (bankService.deleteBankAccount(accountId)) {
					out.println("<h2>Account deleted Successfully...");
					out.println("<h2><a href = 'index.html'>|Home|</h2>");
					out.close();
				}
			} catch (BankAccountNotFoundException e) {
				logger.error("Exception ", e);
			}
		}

		if (path.equals("/deposit.do")) {
			long accountId = Long.parseLong(request.getParameter("account_id"));
			double amount = Double.parseDouble(request.getParameter("account_balance"));

			try {

				double balance = bankService.deposit(accountId, amount);
				out.println("<h2>Amount added Successfully");
				out.println("<h2><a href = 'index.html'>|Home|</h2>");
				out.close();

			} catch (BankAccountNotFoundException e) {
				logger.error("Exception", e);
			}

		}

		if (path.equals("/withdraw.do")) {
			long accountId = Long.parseLong(request.getParameter("account_id"));
			double amount = Double.parseDouble(request.getParameter("account_balance"));

			try {
				double balance = bankService.withdraw(accountId, amount);
				out.println("<h2>Amount Withdraw Successfully");
				out.println("<h2><a href = 'index.html'>|Home|</h2>");
				out.close();
			} catch (BankAccountNotFoundException | LowBalanceException e) {
				logger.error("Exception", e);

			}
		}

		if (path.equals("/fundTransfer.do")) {
			long fromAccount = Long.parseLong(request.getParameter("account_id"));
			long toAccount = Long.parseLong(request.getParameter("account_id"));
			double amount = Double.parseDouble(request.getParameter("account_balance"));

			try {
				bankService.fundTransfer(fromAccount, toAccount, amount);
				out.println("</h2>Fund Transffered Succsessfully");
				out.println("<h2><a href = 'index.html'>|Home|</h2>");
				out.close();
			} catch (BankAccountNotFoundException | LowBalanceException e) {
				logger.error("Exception", e);
			}
		}

		if (path.equals("/searchAccountDetails.do")) {
			long accountId = Long.parseLong(request.getParameter("account_id"));
			try {
				BankAccount account = bankService.searchAccountDetails(accountId);
				RequestDispatcher dispatcher = request.getRequestDispatcher("searchAccountDetails.jsp");
				request.setAttribute("accounts", account);
				dispatcher.forward(request, response);
				out.close();

			} catch (BankAccountNotFoundException e) {

				logger.error("Exception", e);
			}
		}
		
		if (path.equals("/updateBankAccountDetails.do")) {
			long accountId = Long.parseLong(request.getParameter("account_id"));
			BankAccount account;
			try {
				account = bankService.searchAccountDetails(accountId);
				RequestDispatcher dispatcher = request.getRequestDispatcher("updateAccountDetailsById.jsp");
				request.setAttribute("accounts", account);
				dispatcher.forward(request, response);
			} catch (BankAccountNotFoundException e) {
				logger.error("Exception", e);
			}
		}
		
		if(path.equals("/updateAccountDetails.do")) {
			long accountId = Long.parseLong(request.getParameter("account_id"));
			String updatedName = request.getParameter("customer_name");
			String updatedType = request.getParameter("account_type");
			
			try {
				boolean account = bankService.updateBankAccount(accountId, updatedName, updatedType);
				if(account) {
					response.sendRedirect("details.jsp");
				}
			} catch (BankAccountNotFoundException e) {
				e.printStackTrace();
			}
		}

	}
}
