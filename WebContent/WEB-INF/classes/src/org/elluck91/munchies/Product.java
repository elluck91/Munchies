/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.elluck91.munchies;

import java.sql.Date;

/**
 *
 * @author elluck91
 */
public class Product {
    public String name;
	public float price;
	public String img; 
	
	public Product(){
		super();
	}
	
	public void setName(String s){
		this.name = s;
	}
	
	public void setPrice(float n){
		this.price = n;
	}
	
	public void setImg(String i){
		this.img = i;
	}
	
		
}
