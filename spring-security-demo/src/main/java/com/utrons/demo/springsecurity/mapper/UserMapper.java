package com.utrons.demo.springsecurity.mapper;

import com.utrons.demo.springsecurity.domain.Resource;
import com.utrons.demo.springsecurity.domain.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    User findByName(String username);
    List<Resource> getResources(String username);
}
