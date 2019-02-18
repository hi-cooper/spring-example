CREATE DATABASE IF NOT EXISTS spring_security_demo DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
use spring_security_demo;

drop table if exists RoleResource;

drop table if exists UserRole;

drop table if exists Resource;

drop table if exists Role;

drop table if exists User;

/*==============================================================*/
/* Table: Resource                                              */
/*==============================================================*/
create table Resource
(
   id                   bigint not null auto_increment comment '资源ID',
   parentId             bigint comment '父级ID',
   name                 varchar(50) comment '名称',
   type                 int comment '类型。1-菜单；2-页面内元素；3-API；',
   method               varchar(10) comment '请求方式。如GET、POST、PUT、PATCH、DELETE等',
   url                  varchar(100) comment 'url',
   authorities          varchar(255) comment '权限列表。格式【请求方式:url】，多个权限描述以逗号(,)分隔。如：【GET:/users,GET:/users/list】表示以get和post方式请求用户列表',
   primary key (id)
);

alter table Resource comment '资源';

/*==============================================================*/
/* Table: Role                                                  */
/*==============================================================*/
create table Role
(
   id                   bigint not null auto_increment comment '角色ID',
   name                 varchar(50) comment '名称',
   primary key (id)
);

alter table Role comment '角色';

/*==============================================================*/
/* Table: RoleResource                                          */
/*==============================================================*/
create table RoleResource
(
   roleId               bigint not null comment '角色ID',
   resourceId           bigint not null comment '资源ID',
   primary key (roleId, resourceId)
);

alter table RoleResource comment '角色资源';

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   id                   bigint not null auto_increment comment '用户ID',
   username             varchar(30) comment '用户名',
   password             varchar(256) comment '密码',
   status               int comment '状态。1-正常； 2-禁用； 3-已删除；',
   primary key (id)
);

alter table User comment '用户';

/*==============================================================*/
/* Table: UserRole                                              */
/*==============================================================*/
create table UserRole
(
   userId               bigint not null comment '用户ID',
   roleId               bigint not null comment '角色ID',
   primary key (userId, roleId)
);

alter table UserRole comment '用户角色';

alter table Resource add constraint FK_Resource_Resource foreign key (parentId)
      references Resource (id) on delete restrict on update restrict;

alter table RoleResource add constraint FK_RoleResource foreign key (roleId)
      references Role (id) on delete restrict on update restrict;

alter table RoleResource add constraint FK_RoleResource2 foreign key (resourceId)
      references Resource (id) on delete restrict on update restrict;

alter table UserRole add constraint FK_UserRole foreign key (userId)
      references User (id) on delete restrict on update restrict;

alter table UserRole add constraint FK_UserRole2 foreign key (roleId)
      references Role (id) on delete restrict on update restrict;
