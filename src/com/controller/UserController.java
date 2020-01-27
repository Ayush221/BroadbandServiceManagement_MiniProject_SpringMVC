package com.controller;

import java.util.List;
import javax.validation.Valid;  
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.validation.BindingResult;  

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model.Package;
import com.model.Company;
import com.model.Customer;
import com.model.Order;
import com.dao.*;

@Controller
@Scope("session")
public class UserController {
	
	@Autowired  
	UserDao dao;
	
	    @RequestMapping(value="/userpackage/{id}")    
        public String edit(HttpServletRequest request,@PathVariable int id, Model m)
	    {    
	    System.out.println(id);
	    request.getSession().setAttribute("companyid",id);
 	    return "redirect:/package";    
        }
	 
	    @RequestMapping("/package")    
	    public String viewpackage(HttpServletRequest request,Model m)
	    {    
	    int id=(Integer)request.getSession().getAttribute("companyid");
	    List<Package> list=dao.searchPackage(id);
	    Company c=dao.companySearch(id);
	   request.getSession().setAttribute("company_name", c.getCompany_name());
	 	m.addAttribute("list",list);  
	    return "viewpackage";   
	    }
	    
	    @RequestMapping("/customerregistration")    
	    public String customerRegistrationForm(Model m)
	    {    
	    m.addAttribute("command", new Customer());  
	    return "customerregistration";   
	    }
	    
	    @RequestMapping(value="/save",method = RequestMethod.POST)    
	    public String save(@Valid @ModelAttribute("command") Customer cust,BindingResult br)
	   
	    {    if(br.hasErrors())  
        {  
            return "customerregistration";  
        }  
        else  
        {  
        	 dao.save(cust);    
     	    return "usersuccessregister"; 
        }  
	   
	    } 
	  
		@RequestMapping(value="/userlogin",method=RequestMethod.GET)    
	    public String login(Model m)
		{    
	    return "userlogin";   
	    }
		
		@RequestMapping(value="/login",method = RequestMethod.POST)    
        public String userlogin(HttpServletRequest request,HttpServletResponse response,HttpSession session,@ModelAttribute("userlogin") Customer userlogin,Model m){    
        Customer c=dao.login(userlogin);
        if(c==null)
        {
        m.addAttribute("loginError","Either username or password is incorrect");
        return "userlogin";  
        }
        else
        {
        request.getSession().setAttribute("customerid",c.getCustomer_id());
        session.setAttribute("id", c.getCustomer_id());
        //request.getSession().setAttribute("email",c.getEmail());
        session.setAttribute("uname", c.getEmail());
    	List<Company> list1= dao.getCompany();
    	m.addAttribute("list1",list1); 
        return "serviceproviderlist"; 
        }
        }
		
		@RequestMapping(value="/buypackage/{id}")    
	    public String buypackage(HttpServletRequest request,HttpServletResponse response,HttpSession session,@PathVariable int id, Model m)
	    { 
         
		String id1 =(String)request.getSession().getAttribute("uname");
		if(id1==null)
		{    
		return "redirect:/index.jsp";
		}
		else
		{ 
		session.setAttribute("packageid",id);
		m.addAttribute("orderdetails", new Order());  
		Package p=dao.getPackageById(id); 
		request.getSession().getAttribute("packageid");
		m.addAttribute("onemonth",p.getOne_month());
		System.out.println(m.addAttribute("onemonth",p.getOne_month()));
		m.addAttribute("threemonth",p.getThree_month());
		m.addAttribute("sixmonth",p.getSix_month());
		m.addAttribute("twelvemonth",p.getTwelve_month());
		System.out.println(m.addAttribute("twelvemonth",p.getTwelve_month()));
		return "buypackage"  ;
	    }
		}
	
		
		@RequestMapping(value="/orderdetailsave")    
	    public String orderdetailssave(HttpServletRequest request,HttpSession session,@ModelAttribute("orderdetails") Order orderdetails, Model m)
		{   
			System.out.println("2");
			orderdetails.setPackageid((Integer)request.getSession().getAttribute("packageid"));
			orderdetails.setCompanyid((Integer)request.getSession().getAttribute("companyid"));
			orderdetails.setCustomerid((Integer)request.getSession().getAttribute("customerid"));
		        System.out.println("1");
		        dao.orderDetailSave(orderdetails);
			    return "orderplaced"  ; 
		}
		
		@RequestMapping(value = "/logout")
	    public String logout(HttpServletRequest request) {
	        HttpSession httpSession = request.getSession();
	        httpSession.invalidate();
	        return "redirect:index.jsp";
	    }
		 
		
}
