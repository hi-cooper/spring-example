package com.utrons.authserver.mapper;

import com.utrons.authserver.model.Resource;
import com.utrons.authserver.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface UserMapper {
    User findByName(String username);
    List<Resource> getResources(String username);
}
