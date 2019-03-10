package com.utrons.authserver.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
public class Resource implements Serializable {
    private static final long serialVersionUID = -8546906843893783204L;
    /** 资源ID */
    private Long resourceId;
    /** 父级ID */
    private Long parentId;
    /** 名称 */
    private String name;
    /** 类型：1-菜单；2-API */
    private Integer type;
    /** 请求方式。如GET、POST、PUT、PATCH、DELETE等 */
    private String method;
    /** url */
    private String url;
    /** 权限列表。格式【请求方式:url】，多个权限描述以逗号(,)分隔。如：【GET:/users,GET:/users/list】表示以get和post方式请求用户列表 */
    private String authorities;
    /** 路径，以/和id组成，表示该节点的祖辈级关系。如/1/2/3/4表示谝节点父级是id为4的记录 */
    private String path;
    /** 排序 */
    private Integer seq;
    /** 描述 */
    private String description;
}
