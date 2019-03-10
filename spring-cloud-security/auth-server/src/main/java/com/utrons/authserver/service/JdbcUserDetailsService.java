package com.utrons.authserver.service;

import com.utrons.authserver.mapper.UserMapper;
import com.utrons.authserver.model.Resource;
import com.utrons.authserver.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class JdbcUserDetailsService implements UserDetailsService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = this.userMapper.findByName(username);

        if (null == user) {
            throw new UsernameNotFoundException("用户不存在[" + username + "]");
        }

        List<Resource> datas = this.userMapper.getResources(username);
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (Resource obj : datas) {
            if (null == obj.getAuthorities()) {
                continue;
            }

            String[] auths = obj.getAuthorities().split(",");
            for (String auth : auths) {
                authorities.add(new SimpleGrantedAuthority(auth));
            }
        }
        boolean isEnabled = (1 == user.getStatus()) ? true : false;
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), isEnabled, true, true, true, authorities);
    }
}
