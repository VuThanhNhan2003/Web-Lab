package com.wadlab.academy_bank.services.impl;

import java.util.List;

import com.wadlab.academy_bank.dto.BankResponse;
import com.wadlab.academy_bank.dto.UserRequest;
import com.wadlab.academy_bank.entity.User;

public interface UserService {
    BankResponse createAccount(UserRequest userRequest);
    
    List<User> getAllUsers();  
    
    User getUserById(Long id); 
    
    void deleteUser(Long id);  
    
    User updateUser(Long id, UserRequest userRequest);  
}

