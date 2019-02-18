package com.utrons.demo.springsecurity.domain;

import java.io.Serializable;

public class User implements Serializable {
    private static final long serialVersionUID = -6578157774312634175L;
    /** 用户ID */
    private Long id;
    /** 用户名 */
    private String username;
    /** 密码 */
    private String password;
    /** 状态。1-正常； 2-禁用； 3-已删除； */
    private Integer status;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
