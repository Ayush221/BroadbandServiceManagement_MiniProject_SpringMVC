
package com.model;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;


public class Package {
	
	
	private int package_id;
	
	private int companyId;
	
	@NotEmpty
	@Size(min=4, max=20)
	private String plan_name;
	
	@NotEmpty
	private String speed;
	private String fup;
	private String post_fup;
	private int one_month;
	private int three_month;
	private int six_month;
	private int twelve_month;
	public int getPackage_id() {
		return package_id;
	}
	public void setPackage_id(int package_id) {
		this.package_id = package_id;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public String getPlan_name() {
		return plan_name;
	}
	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}
	public String getSpeed() {
		return speed;
	}
	public void setSpeed(String speed) {
		this.speed = speed;
	}
	public String getFup() {
		return fup;
	}
	public void setFup(String fup) {
		this.fup = fup;
	}
	public String getPost_fup() {
		return post_fup;
	}
	public void setPost_fup(String post_fup) {
		this.post_fup = post_fup;
	}
	public int getOne_month() {
		return one_month;
	}
	public void setOne_month(int one_month) {
		this.one_month = one_month;
	}
	public int getThree_month() {
		return three_month;
	}
	public void setThree_month(int three_month) {
		this.three_month = three_month;
	}
	public int getSix_month() {
		return six_month;
	}
	public void setSix_month(int six_month) {
		this.six_month = six_month;
	}
	public int getTwelve_month() {
		return twelve_month;
	}
	public void setTwelve_month(int twelve_month) {
		this.twelve_month = twelve_month;
	}
}