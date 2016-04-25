/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gr.athtech.mis.web;

import gr.athtech.mis.model.Role;
import gr.athtech.mis.model.User;
import gr.athtech.mis.service.RoleService;
import gr.athtech.mis.service.UserService;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author JurgenPC
 */
@Controller 
@RequestMapping(value = "/users")
public class UserController {
    
    private final Logger logger = LoggerFactory.getLogger(UserController.class);
    
    @Autowired 
    private UserService userService;
    @Autowired
    private RoleService roleService;
    
    /**
     * Return the view that will display all the users
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Map<String, Object> model){
        
        List<User> users = userService.findAll();
        
        logger.debug("------------------USERS");
        model.put("users", users);
        
        return "users/view";
    }
    
    /**
     * Return the view that holds the create new user form
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String store(Model model){
        
        //fetch all the attributed that wil be prefilled
        List<Role> roles = roleService.findAll();
        
        model.addAttribute("roles", roles);
        
        return "users/create";     
    }
    
    /**
     * Store a new user
     *
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/store", method = RequestMethod.POST)
    public String store(HttpServletRequest request,
            HttpServletResponse response, Model model) {

        Role role = roleService.findOne(Long.parseLong(request.getParameter("roleId")));
        List roles = new ArrayList();
        roles.add(role);
        User user = new User();
        user.setFirstName(request.getParameter("firstName"));
        user.setLastName(request.getParameter("lastName"));
        user.setUsername(request.getParameter("username"));
        user.setPassword(request.getParameter("password"));
        user.setRoles(roles);
        //user.setRoles((List<Role>) roleService.findOne(role));

        logger.debug("----- New user: ", user);

        userService.save(user);
        return "users/view";
    }
    
    /**
     * Return the view that holds the edit user form
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") Long id, Model model) {

        List<Role> roles = roleService.findAll();
        User user = userService.findById(id);
        model.addAttribute("user", user);
        model.addAttribute("roles", roles);

        return "users/edit";
    }
    
    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    public String update(@ModelAttribute("doctor") User user) {

        userService.update(user);     
        return "doctors";
    }
    
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable("id") int id) {

        //doctorService.delete(id);
        return "doctors";
    }
    
}
