package com.dao;

import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.model.Company;
import com.model.Customer;
import com.model.Order;
import com.model.Package;

public class UserDao  implements UserDaoI{
	
	 JdbcTemplate template; 
	public void setTemplate(JdbcTemplate template) {    
	    this.template = template;    
	}
	
	public List<Package> searchPackage(int id) {
		String sql="select * from package where package.companyid=?";
		  return template.query(sql,new Object[] {id},new RowMapper<Package>(){    
		       public Package mapRow(ResultSet rs, int row) throws SQLException {    
		    	   Package p=new Package();
		    	   p.setPackage_id(rs.getInt(1));
		    	   p.setCompanyId(rs.getInt(2));
		    	   p.setPlan_name(rs.getString(3));
		    	   p.setSpeed(rs.getString(4));
		    	   p.setFup(rs.getString(5));
		    	   p.setPost_fup(rs.getString(6));
		    	   p.setOne_month(rs.getInt(7));
		    	   p.setThree_month(rs.getInt(8));
		    	   p.setSix_month(rs.getInt(9));
		    	   p.setTwelve_month(rs.getInt(10));
		    	  
		            return p;            }    
		   });
	} 
public int save(Customer p){  
		
	    String sql="insert into customer(name_first,name_last,mobile,email,password,purpose,address,city) values('"+p.getName_first()+"','"+p.getName_last()+"',"+p.getMobile()+",'"+p.getEmail()+"','"+p.getPassword()+"','"+p.getPurpose()+"','"+p.getAddress()+"','"+p.getCity()+"')";    
	    return template.update(sql); 
}

public Customer login(Customer c){
    try {   
        String sql="select * from customer where customer.email=? and customer.password=?"; 
        return template.queryForObject(sql, new Object[]{c.getEmail(),c.getPassword()},new BeanPropertyRowMapper<Customer>(Customer.class));  
    }
    catch(EmptyResultDataAccessException e) 
    {
	return null;
	}
    }


public  List<Company> getCompany()
{  
return template.query("select * from company",new RowMapper<Company>()
{    
public Company mapRow(ResultSet rs, int row) throws SQLException {    
	   Company e=new Company();   
	   e.setCompany_id(rs.getInt(1));    
       e.setCompany_name(rs.getString(2));    
       e.setEmail(rs.getString(3));
       e.setPassword(rs.getString(4));
       e.setAddress(rs.getString(5));
       e.setCity(rs.getString(6));
       e.setState(rs.getString(7));
       e.setCountry(rs.getString(8));
       e.setMobile(rs.getLong(9));
       e.setGst(rs.getString(10));
       e.setImage(rs.getString(11));
        return e;            }    
});    
} 

public Company companySearch(int id){    
    String sql="select * from company where company.company_id=?"; 
    return template.queryForObject(sql, new Object[] {id},new BeanPropertyRowMapper<Company>(Company.class));  
    }

public int orderDetailSave(Order o){  
	
    String sql="insert into group012_ola.order(packageid,companyid,customerid,billing_address,mobile,buyer_name,choose_duration) values("+o.getPackageid()+","+o.getCompanyid()+","+o.getCustomerid()+",'"+o.getBilling_address()+"','"+o.getMobile()+"','"+o.getBuyer_name()+"',"+o.getDuration()+")";    
    return template.update(sql); 
}
public Package getPackageById(int id){    
    String sql="select * from package where package_id=?";    
    return template.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper<Package>(Package.class));    
}
}
