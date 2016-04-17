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
        return "user/userView";
    }
    
    @RequestMapping(value = "/users/view/{id}", method = RequestMethod.GET)
    public String viewUserEditPage(@PathVariable Long id, Model model) {
        model.addAttribute("userId", id); //this id can be replaced by hash from DB for security, not from HTTP GET request
        return "user/userEditPage";
    }
    
    @ResponseBody
    @RequestMapping(value = "/users/{id}", method = RequestMethod.GET, produces = {"application/json; charset=utf-8","application/xml; charset=utf-8"})
    public User getUserById(@PathVariable Long id) {
        return userService.getUserById(id);
    }
    
    @ResponseBody
    @RequestMapping(value = "/users/create", method = RequestMethod.POST, produces = {"application/json; charset=utf-8","application/xml; charset=utf-8"})
    public User createNewUser(@ModelAttribute("newuser") User newUser) {
        return userService.createUser(newUser);
    }

    @ResponseBody
    @RequestMapping(value = "/users", method = RequestMethod.GET, produces = {"application/json; charset=utf-8","application/xml; charset=utf-8"})
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }
    
    @ResponseBody
    @RequestMapping(value = "/users/edit/{id}", method = RequestMethod.PUT, produces = {"application/json; charset=utf-8","application/xml; charset=utf-8"})
    public User editUser(@ModelAttribute("edituser") User editUser) {
        return userService.updateUser(editUser);
    }
    
    @ResponseBody
    @RequestMapping(value = "/users/delete/{id}", method = RequestMethod.DELETE, produces = {"application/json; charset=utf-8","application/xml; charset=utf-8"})
    public Long deleteUser(@PathVariable Long id) {
        return userService.deleteUserById(id);
    }
}
