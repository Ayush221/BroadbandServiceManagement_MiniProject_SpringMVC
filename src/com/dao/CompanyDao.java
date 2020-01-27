package com.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;



import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.model.Company;
import com.model.Package;
public class CompanyDao implements CompanyDaoI {

 JdbcTemplate template;    
    
	public void setTemplate(JdbcTemplate template) {    
	    this.template = template;    
	} 

	public int update(Package p){    
	    String sql="update package set plan_name='"+p.getPlan_name()+"', speed='"+p.getSpeed()+"',fup='"+p.getFup()+"',post_fup='"+p.getPost_fup()+"',one_month="+p.getOne_month()+",three_month="+p.getThree_month()+",six_month="+p.getSix_month()+",twelve_month="+p.getTwelve_month()+" where package_id="+p.getPackage_id()+"";    
	    return template.update(sql);    
	}
	
	public Package getPackageById(int id){    
	    String sql="select * from package where package_id=?";    
	    return template.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper<Package>(Package.class));    
	}  
	
    public int save(Company c){    
	    String sql="insert into company(company_name,email,password,address,city,state,country,mobile,gst,image) values('"+c.getCompany_name()+"','"+c.getEmail()+"','"+c.getPassword()+"','"+c.getAddress()+"','"+c.getCity()+"','"+c.getState()+"','"+c.getCountry()+"',"+c.getMobile()+",'"+c.getGst()+"','"+ c.getImage()+"')";    
	    return template.update(sql);    
	} 

    public int savePack(Package p){    
        String sql="insert into package(companyid,plan_name,speed,fup,post_fup,one_month,three_month,six_month,twelve_month) values('"+p.getCompanyId()+"','"+p.getPlan_name()+"','"+p.getSpeed()+"','"+p.getFup()+"','"+p.getPost_fup()+"','"+p.getOne_month()+"','"+p.getThree_month()+"',"+p.getSix_month()+",'"+p.getTwelve_month()+"')";    
        return template.update(sql);    
    } 
    
    public Company search(Company c){
    try {   
        String sql="select * from company where company.email=? and company.password=?"; 
        return template.queryForObject(sql, new Object[]{c.getEmail(),c.getPassword()},new BeanPropertyRowMapper<Company>(Company.class));  
    }
    catch(EmptyResultDataAccessException e) 
    {
	return null;
	}
    } 
    
    public Company companySearch(int id){    
    String sql="select * from company where company.id=?"; 
    return template.queryForObject(sql, new Object[] {id},new BeanPropertyRowMapper<Company>(Company.class));  
    }

    public List<Package> searchPackage(int id)
    {  
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

    public Company getCompanyById(int id){    
    String sql="select * from company where id=?";    
    return template.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper<Company>(Company.class));    
    }  
    }
