drop table if exists oauth_access_token;

drop table if exists oauth_approvals;

drop table if exists oauth_client_details;

drop table if exists oauth_client_token;

drop table if exists oauth_code;

drop table if exists oauth_refresh_token;

/*==============================================================*/
/* Table: oauth_access_token                                    */
/*==============================================================*/
create table oauth_access_token
(
   token_id             VARCHAR(256) comment '将access_token的值通过MD5加密后存储',
   token                LONGBLOB comment '存储将OAuth2AccessToken.java对象序列化后的二进制数据, 是真实的AccessToken的数据值',
   authentication_id    VARCHAR(256) not null comment '根据当前的username(如果有),client_id与scope通过MD5加密生成',
   user_name            VARCHAR(256) comment '用户名',
   client_id            VARCHAR(256) comment '客户端ID',
   authentication       LONGBLOB comment '存储将OAuth2Authentication.java对象序列化后的二进制数据',
   refresh_token        VARCHAR(256) comment 'refresh_token的值通过MD5加密后存储',
   primary key (authentication_id)
);

alter table oauth_access_token comment '非客户端模式access_token信息';

/*==============================================================*/
/* Table: oauth_approvals                                       */
/*==============================================================*/
create table oauth_approvals
(
   userId               VARCHAR(256) comment '用户名',
   clientId             VARCHAR(256) comment '客户端ID',
   scope                VARCHAR(256) comment 'scope',
   status               VARCHAR(10) comment '状态',
   expiresAt            TIMESTAMP comment '失效时间',
   lastModifiedAt       TIMESTAMP comment '最后修改时间'
);

alter table oauth_approvals comment '授权信息';

/*==============================================================*/
/* Table: oauth_client_details                                  */
/*==============================================================*/
create table oauth_client_details
(
   client_id            VARCHAR(256) not null comment '客户端标识',
   resource_ids         VARCHAR(256) comment '客户端所能访问的资源id集合,多个资源时用逗号(,)分隔,如: "unity-resource,mobile-resource". ',
   client_secret        VARCHAR(256) comment '客户端密钥',
   scope                VARCHAR(256) comment '指定客户端申请的权限范围,可选值包括read,write,trus等t;若有多个权限范围用逗号(,)分隔,如: "read,write". ',
   authorized_grant_types VARCHAR(256) comment '指定客户端支持的grant_type,可选值包括authorization_code,password,refresh_token,implicit,client_credentials, 若支持多个grant_type用逗号(,)分隔,如: "authorization_code,password".
            在实际应用中,当注册时,该字段是一般由服务器端指定的,而不是由申请者去选择的,最常用的grant_type组合有: "authorization_code,refresh_token"(针对通过浏览器访问的客户端); "password,refresh_token"(针对移动设备的客户端).
            implicit与client_credentials在实际中很少使用.',
   web_server_redirect_uri VARCHAR(256) comment '重定向url',
   authorities          VARCHAR(256) comment '指定客户端所拥有的Spring Security的权限值,可选, 若有多个权限值,用逗号(,)分隔, 如: "ROLE_UNITY,ROLE_USER". ',
   access_token_validity INTEGER comment '设定客户端的access_token的有效时间值(单位:秒),可选, 若不设定值则使用默认的有效时间值(60 * 60 * 12, 12小时). ',
   refresh_token_validity INTEGER comment '设定客户端的refresh_token的有效时间值(单位:秒),可选, 若不设定值则使用默认的有效时间值(60 * 60 * 24 * 30, 30天). ',
   additional_information VARCHAR(4096) comment '预留的字段,在Oauth的流程中没有实际的使用,可选,但若设置值,必须是JSON格式的数据',
   autoapprove          VARCHAR(256) comment '设置用户是否自动Approval操作, 默认值为 ''false'', 可选值包括 ''true'',''false'', ''read'',''write''. ',
   primary key (client_id)
);

alter table oauth_client_details comment '客户端信息';

/*==============================================================*/
/* Table: oauth_client_token                                    */
/*==============================================================*/
create table oauth_client_token
(
   authentication_id    VARCHAR(256) not null comment '根据当前的username(如果有),client_id与scope通过MD5加密生成',
   token_id             VARCHAR(256) comment 'access_token的值',
   token                LONGBLOB comment '二进制的字段, 存储的数据是OAuth2AccessToken.java对象序列化后的二进制数据',
   user_name            VARCHAR(256) comment '用户名',
   client_id            VARCHAR(256) comment '客户端IDS',
   primary key (authentication_id)
);

alter table oauth_client_token comment '客户端模式access_token';

/*==============================================================*/
/* Table: oauth_code                                            */
/*==============================================================*/
create table oauth_code
(
   code                 VARCHAR(256) comment '存储服务端系统生成的code的值(未加密).',
   authentication       LONGBLOB comment 'AuthorizationRequestHolder.java对象序列化后的二进制数据'
);

alter table oauth_code comment '授权码信息';

/*==============================================================*/
/* Table: oauth_refresh_token                                   */
/*==============================================================*/
create table oauth_refresh_token
(
   token_id             VARCHAR(256) comment 'refresh_token的值通过MD5加密后存储',
   token                LONGBLOB comment 'OAuth2RefreshToken.java对象序列化后的二进制数据.',
   authentication       LONGBLOB comment 'OAuth2Authentication.java对象序列化后的二进制数据'
);

alter table oauth_refresh_token comment '刷新token信息';
