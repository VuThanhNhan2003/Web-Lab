package com.wadlab.academy_bank.services.impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wadlab.academy_bank.dto.AccountInfo;
import com.wadlab.academy_bank.dto.BankResponse;
import com.wadlab.academy_bank.dto.UserRequest;
import com.wadlab.academy_bank.entity.User;
import com.wadlab.academy_bank.repository.UserRepository;
import com.wadlab.academy_bank.utils.AccountUtilis;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepository userRepository;

    @Override
    public BankResponse createAccount(UserRequest userRequest) {
        if(userRepository.existsByEmail(userRequest.getEmail())) {
            return BankResponse.builder()
                    .responeCode(AccountUtilis.ACCOUNT_EXISTS_CODE)
                    .responeMessage(AccountUtilis.ACCOUNT_EXISTS_MESSAGE)
                    .AccountInfo(null)
                    .build();
        }

        User newUser = User.builder()
                        .firstName(userRequest.getFirstName())
                        .lastName(userRequest.getLastName())
                        .otherName(userRequest.getOtherName())
                        .address(userRequest.getAddress())
                        .sateOfOrigin(userRequest.getSateOfOrigin())
                        .accountNumber(AccountUtilis.generateAccountNumber())
                        .accountBalance(BigDecimal.ZERO)
                        .phoneNumber(userRequest.getPhoneNumber())
                        .alternativePhoneNumber(userRequest.getAlternativePhoneNumber())
                        .email(userRequest.getEmail())
                        .status("ACTIVE")
                        .build();

        User savedUser = userRepository.save(newUser);
        AccountInfo accountInfo = AccountInfo.builder()
                                .accountBalance(savedUser.getAccountBalance())
                                .accountNumber(savedUser.getAccountNumber())
                                .accountName(savedUser.getFirstName() + " " + savedUser.getLastName() + " " + savedUser.getOtherName())
                                .build();

        return BankResponse.builder()
                .responeCode(AccountUtilis.ACCOUNT_CREATION_SUCCESS_CODE)
                .responeMessage(AccountUtilis.ACCOUNT_CREATION_SUCCESS_MASSAGE)
                .AccountInfo(accountInfo)
                .build();
    }

    @Override
    public List<User> getAllUsers() {
        return userRepository.findAll();  
    }

    @Override
    public User getUserById(Long id) {
        Optional<User> user = userRepository.findById(id);  
        return user.orElse(null);  
    }

    @Override
    public void deleteUser(Long id) {
        Optional<User> user = userRepository.findById(id);  
        if (user.isPresent()) {
            userRepository.deleteById(id);  
        } else {
            throw new RuntimeException("User not found with ID: " + id);  
        }
    }

    @Override
    public User updateUser(Long id, UserRequest userRequest) {
        Optional<User> existingUser = userRepository.findById(id);  
        if (existingUser.isPresent()) {
            User userToUpdate = existingUser.get();
            // Update user properties
            userToUpdate.setFirstName(userRequest.getFirstName());
            userToUpdate.setLastName(userRequest.getLastName());
            userToUpdate.setOtherName(userRequest.getOtherName());
            userToUpdate.setAddress(userRequest.getAddress());
            userToUpdate.setSateOfOrigin(userRequest.getSateOfOrigin());
            userToUpdate.setPhoneNumber(userRequest.getPhoneNumber());
            userToUpdate.setAlternativePhoneNumber(userRequest.getAlternativePhoneNumber());
            userToUpdate.setEmail(userRequest.getEmail());
            userToUpdate.setStatus(userRequest.getStatus());

            return userRepository.save(userToUpdate);  
        } else {
            throw new RuntimeException("User not found with ID: " + id); 
        }
    }
}
