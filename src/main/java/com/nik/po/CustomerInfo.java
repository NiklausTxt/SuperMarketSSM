package com.nik.po;

public class CustomerInfo extends Customer{
	private CustomerLogin customerLogin;
	
	public CustomerLogin getCustomerLogin() {
		return customerLogin;
	}

	public void setCustomerLogin(CustomerLogin customerLogin) {
		this.customerLogin = customerLogin;
	}


}
