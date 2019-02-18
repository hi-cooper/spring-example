package com.utrons.demo.springsecurity.web;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
public class OpenAPIController {

    @GetMapping("/getUsername")
    @PreAuthorize("hasAuthority('GET:/api/v1/getUsername')")
    public String getUsername() {
        return "OpenAPI: getUsername";
    }

    @PostMapping("/getUserInfo")
    @PreAuthorize("hasAuthority('GET:/api/v1/getUserInfo')")
    public String getUserInfo() {
        return "OpenAPI: getUserInfo";
    }
}
