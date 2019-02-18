package com.utrons.demo.springsecurity.domain;

import java.io.Serializable;

public class Resource implements Serializable {
    private static final long serialVersionUID = 5732036223839637483L;
    /** 资源ID */
    private Long id;
    /** 父级ID */
    private Long parentId;
    /** 名称 */
    private String name;
    /** 类型。1-菜单；2-页面内元素；3-API； */
    private Integer type;
    /** 请求方式。如GET、POST、PUT、PATCH、DELETE等 */
    private String method;
    /** url */
    private String url;
    /** 权限列表。格式【请求方式:url】，多个权限描述以逗号(,)分隔。如：【GET:/users,GET:/users/list】表示以get和post方式请求用户列表 */
    private String authorities;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getAuthorities() {
        return authorities;
    }

    public void setAuthorities(String authorities) {
        this.authorities = authorities;
    }
}
