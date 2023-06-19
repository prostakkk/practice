package org.example.controllers;

import org.example.entities.User;
import org.example.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping()

    public String showAll(Model model) {
        List<User> users = userService.getUsers();
        model.addAttribute("users", users);
        return "test/index";
    }

    @GetMapping("/{id}")
    public String show(@PathVariable("id") int id, Model model){

        model.addAttribute("users",userService.getUser(id));
        return "test/show";
    }
    @GetMapping("/new")
    public String newPerson(Model model) {
        model.addAttribute("users", new User());
        return "test/new";
    }
    @PostMapping()
    public String create(@ModelAttribute("users") User person) {
        userService.saveUser(person);
        return "redirect:/users";
    }

    @GetMapping("/{id}/edit")
    public String edit(Model model, @PathVariable("id") int id){
        model.addAttribute("users", userService.getUser(id));
        return "test/edit";
    }

    @PatchMapping("/{id}")
   public String update(@ModelAttribute("users") User person, @PathVariable("id") int id){
   /*  userService.update(id, person);
    return "redirect:/people";*/
    return null;
    }

    @DeleteMapping("/{id}")
    public String delete(@PathVariable("id") int id){
    userService.deleteUser(id);
        return "redirect:/users";
    }
}
