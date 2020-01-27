package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.CompanyDao;
import com.model.Company;
import com.model.Customer;
import com.model.Package;
@Controller
@Scope("session")
public class CompanyController {
	
	@Autowired 
    CompanyDao dao1;
	
	       @RequestMapping(value="/addpackage",method=RequestMethod.GET)    
           public String addpackage(Model m){
	       m.addAttribute("command", new Package());    
           return "addpackage";   
           }
    
	       @RequestMapping(value="/editsave",method = RequestMethod.POST)    
	       public String editsave(HttpServletRequest request,Model m,@ModelAttribute("command") Package pack){ 
	       int id=(Integer)request.getSession().getAttribute("package_id");
		   pack.setPackage_id(id);
		   System.out.println(pack.getPackage_id());
	       dao1.update(pack); 
	       int id1=(Integer)request.getSession().getAttribute("company_id");
	       List<Package> list=dao1.searchPackage(id1);
	       m.addAttribute("list",list); 
	       return "companypackagelist";    
	       }
	   
	       @RequestMapping(value="/editpackage/{id}")    
	       public String edit(HttpServletRequest request,@PathVariable int id, Model m){    
		   System.out.println(id);
		   m.addAttribute("command", new Package()); 
		   Package p=dao1.getPackageById(id); 
	       System.out.println(p.getSpeed());
	       request.getSession().setAttribute("package_id",id);
	       m.addAttribute("command",p);  
	       return "packageeditform";    
	       }
	       
	       @RequestMapping(value="/savepackage",method=RequestMethod.POST)    
           public String savepackage(HttpServletRequest request,Model m,@Valid @ModelAttribute("command") Package pack,BindingResult br)
           
	       {  
	       int id=(Integer)request.getSession().getAttribute("company_id");
	       pack.setCompanyId(id);
	       if(br.hasErrors())  
		   {  
		    return "addpackage";  
		   }  
		   else 
		   {
		   
		   pack.setCompanyId(id);
		   dao1.savePack(pack);
		   List<Package> list=dao1.searchPackage(id);
     	   m.addAttribute("list",list); 
		   return "companypackagelist";   
           }
	       }
	
	      //company login
	
	      @RequestMapping(value="/cmplogin",method = RequestMethod.POST)    
          public String cmplogin(HttpServletRequest request,HttpServletResponse response,@ModelAttribute("login") Company login,Model m){    
          Company company=dao1.search(login);
          if(company==null)
          {
          m.addAttribute("loginError","Either username or password is incorrect");
          return "companylogin";  
          }
          else
           {
        	 request.getSession().setAttribute("company_id",company.getCompany_id());
             request.getSession().setAttribute("company_name",company.getCompany_name());
             List<Package> list=dao1.searchPackage(company.getCompany_id());
        	 m.addAttribute("list",list); 
             return "companypackagelist"; 
           }
          }
	
	      @RequestMapping(value="/companylogin",method=RequestMethod.GET)    
          public String login(Model m)
	      {    
            return "companylogin";   
          }
	
	
	      @RequestMapping("/companyregistration")    
          public String companyregistrationform(Model m)
	      {   
	    	  m.addAttribute("command", new Company()); 
            return "companyregistration";   
          }
	
	      @RequestMapping(value="/save1",method = RequestMethod.POST)    
          public String save(@Valid @ModelAttribute("command") Company company, BindingResult br)
	      { 
	    	  
	    	  if(br.hasErrors())  
	          {  
	              return "companyregistration";  
	          }  
	          else  
	          {  
	        	  dao1.save(company);    
	              return "comregsuccess";  
	           
	          } 
          }
	
	      @RequestMapping(value="/serviceproviderlist")    
          public String serviceproviderlist(HttpServletRequest request,HttpServletResponse response,Model m){    
		  List<Company> list1= dao1.getCompany();
		  m.addAttribute("list1",list1); 
          return "serviceproviderlist";    
          }
}
