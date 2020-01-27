package com.dao;

import java.util.List;

import com.model.Company;
import com.model.Customer;
import com.model.Order;
import com.model.Package;

public interface UserDaoI {
	public Package getPackageById(int id) ;
	public  List<Company> getCompany();
	 public List<Package> searchPackage(int id);
	 public Company companySearch(int id);
	 public int orderDetailSave(Order o);
	 public Customer login(Customer c);
	 public int save(Customer p);

}
