package com.utrons.demo.springsecurity.web;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/roles")
public class RoleController {

    @GetMapping(value = {"", "/list"})
    @PreAuthorize("hasAnyAuthority('GET:/roles', 'GET:/roles/list')")
    public String list() {
        return "role list";
    }

    @GetMapping("/getName")
    public String getName() {
        return "role getName";
    }
}
