package com.dao;
import com.model.Company;
import com.model.Package;

import java.util.List;

public interface CompanyDaoI {
	public Package getPackageById(int id) ;
	public  List<Company> getCompany();
	 public List<Package> searchPackage(int id);
	 public Company companySearch(int id);
	 public int update(Package p);
	 public int save(Company c);
	 public int savePack(Package p);
	 public Company search(Company c);
	 public Company getCompanyById(int id);

}