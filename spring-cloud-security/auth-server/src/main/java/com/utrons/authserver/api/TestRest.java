package com.utrons.authserver.api;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
public class TestRest {

    @GetMapping(value = {"", "/list"})
    @PreAuthorize("hasAnyAuthority('GET:/test', 'GET:/test/list')")
    public String list() {
        return "LIST";
    }

    @GetMapping("/add")
    @PreAuthorize("hasAuthority('GET:/test/add')")
    public String add() {
        return "ADD";
    }

    @GetMapping("/edit")
    @PreAuthorize("hasAuthority('GET:/test/edit')")
    public String edit() {
        return "EDIT";
    }

    @GetMapping("/detail")
    @PreAuthorize("hasAuthority('GET:/test/detail')")
    public String detail() {
        return "DETAIL";
    }
}
