package com.utrons.authserver.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
@RequestMapping("/")
public class UserRest {
//    @Autowired
//    private ConsumerTokenServices tokenServices;

    @GetMapping
    public String index() {
        return "INDEX";
    }

    @GetMapping("/hello")
    public String hello() {
        return "HELLO";
    }

    @RequestMapping("/api/user")
    public Principal user(Principal user) {
        return user;
    }

//    @DeleteMapping("/oauth/logout")
//    public String logout(HttpServletRequest request) {
//        String authorization = request.getHeader("Authorization");
//        if (authorization != null && authorization.toUpperCase().contains("BEARER")) {
//            String tokenId = authorization.substring("Bearer".length() + 1);
//            System.out.println("tokenId : " + tokenId);
//            tokenServices.revokeToken(tokenId);
//            //tokenStore.removeRefreshToken(token);
//        }
//        return "SUCCESS";
//    }
}
