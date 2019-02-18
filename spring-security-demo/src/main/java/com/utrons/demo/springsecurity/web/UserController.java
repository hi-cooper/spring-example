package com.utrons.demo.springsecurity.web;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/users")
public class UserController {

    @GetMapping(value ={"", "/list"})
    @PreAuthorize("hasAnyAuthority('GET:/users', 'GET:/users/list')")
    public String list() {
        return "user list";
    }

    @PostMapping
    @PreAuthorize("hasAuthority('POST:/users')")
    public String add() {
        return "user add";
    }

    @PutMapping
    @PreAuthorize("hasAuthority('PUT:/users')")
    public String edit() {
        return "user edit";
    }
}
