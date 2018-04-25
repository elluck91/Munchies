/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.elluck91.munchies;

/**
 *
 * @author elluck91
 */
public interface IRepo {
    
     int Login(String username,String password);
     int Register(User user);
     User GetUser(String byUsername);
}
