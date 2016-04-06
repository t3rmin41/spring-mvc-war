package com.simple.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.simple.mvc.domain.User;
import com.simple.mvc.service.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userService;
    
    @RequestMapping(value = "/users/view", method = RequestMethod.GET)
    public String viewUsersPage() {
        return "user/userList";
    }
    
    @RequestMapping(value = "/users/{id}", method = RequestMethod.GET)
    public User getUserById(@PathVariable Long id) {
        return userService.getUserById(id);
    }
    
    @RequestMapping(value = "/users/create", method = RequestMethod.POST)
    public User createNewUser(@ModelAttribute("newuser") User newUser) {
        return userService.createUser(newUser);
    }

    @ResponseBody
    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }
    
    @ResponseBody
    @RequestMapping(value = "/users/edit/{id}", method = RequestMethod.PUT)
    public User editUser(@ModelAttribute("edituser") User editUser) {
        return userService.updateUser(editUser);
    }
    
    @ResponseBody
    @RequestMapping(value = "/users/delete/{id}", method = RequestMethod.DELETE)
    public Long deleteUser(@PathVariable Long id) {
        return userService.deleteUserById(id);
    }
}
