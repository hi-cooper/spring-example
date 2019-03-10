package com.utrons.authserver.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * 项目名称：  legrand-cloud
 * <p>
 * 类名称：    User.java
 * <p>
 * 功能描述：
 * <p>
 * <p>
 *
 * @author Eadwyn
 * <p>
 * 创建时间：  2019/2/2713:21
 * <p>
 * 修改人：
 * <p>
 * 修改时间：
 * <p>
 * 修改备注：
 * <p>
 * <p>
 * 版本号：    V1.0.0
 * <p>
 * 公司：      深圳视得安罗格朗电子有限公司
 */
@Data
@NoArgsConstructor
public class User implements Serializable {
    private static final long serialVersionUID = 8184848346768795743L;
    /** 用户ID */
    private Long userId;
    /** 用户名 */
    private String username;
    /** 密码 */
    private String password;
    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /** 状态：1-正常；2-停用； */
    private Integer status;
}
