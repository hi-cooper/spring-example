drop table if exists UserRole;

drop table if exists RoleResource;

drop table if exists Resource;

drop table if exists Role;

drop table if exists User;

/*==============================================================*/
/* Table: Resource                                          */
/*==============================================================*/
create table Resource
(
   resourceId           bigint not null auto_increment comment 'ID',
   parentId             bigint comment '父级ID',
   name                 varchar(50) comment '名称',
   type                 smallint comment '类型：1-菜单；2-API',
   method               varchar(30) comment '请求方法：GET/POST/PUT/PATCH/DELETE等',
   url                  varchar(256) comment 'url',
   authorities          varchar(256) comment '权限列表',
   path                 varchar(256) comment '路径，以/和id组成，表示该节点的祖辈级关系。如/1/2/3/4表示谝节点父级是id为4的记录',
   seq                  int comment '排序',
   description          varchar(256) comment '描述',
   primary key (resourceId)
);

alter table Resource comment '资源';

/*==============================================================*/
/* Table: Role                                              */
/*==============================================================*/
create table Role
(
   roleId               bigint not null auto_increment comment 'ID',
   roleName             varchar(50) comment '名称',
   createTime           timestamp comment '创建时间',
   description          varchar(256) comment '描述',
   primary key (roleId)
);

alter table Role comment '角色';

/*==============================================================*/
/* Table: RoleResource                                      */
/*==============================================================*/
create table RoleResource
(
   roleId               bigint not null comment '角色ID',
   resourceId           bigint not null comment 'ID',
   primary key (roleId, resourceId)
);

alter table RoleResource comment '角色资源';

/*==============================================================*/
/* Table: User                                              */
/*==============================================================*/
create table User
(
   userId               bigint not null auto_increment comment 'userId',
   username             varchar(50) comment '用户名',
   password             varchar(256) comment '密码',
   createTime           timestamp comment '创建时间',
   status               int comment '状态：1-正常；2-停用；',
   primary key (userId)
);

alter table User comment '用户';

/*==============================================================*/
/* Table: UserRole                                          */
/*==============================================================*/
create table UserRole
(
   userId               bigint not null comment '用户ID',
   roleId               bigint not null comment '角色ID',
   primary key (userId, roleId)
);

alter table UserRole comment '用户角色';

alter table Resource add constraint FK_Relationship_5 foreign key (parentId)
      references Resource (resourceId) on delete restrict on update restrict;

alter table RoleResource add constraint FK_Relationship_3 foreign key (roleId)
      references Role (roleId) on delete restrict on update restrict;

alter table RoleResource add constraint FK_Relationship_4 foreign key (resourceId)
      references Resource (resourceId) on delete restrict on update restrict;

alter table UserRole add constraint FK_Relationship_1 foreign key (userId)
      references User (userId) on delete restrict on update restrict;

alter table UserRole add constraint FK_Relationship_2 foreign key (roleId)
      references Role (roleId) on delete restrict on update restrict;
