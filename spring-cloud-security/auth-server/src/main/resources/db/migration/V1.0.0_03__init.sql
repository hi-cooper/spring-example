-- admin:123456
-- user:123456
-- guest:123456
insert into User(userId, username, password, createTime, status) values(1, 'admin', '$2a$10$y81.5CFxh8lqAZIgIQj82OJcTcTCgeLy6H82BSGLTBpuuQDktnvG6', now(), 1);
insert into User(userId, username, password, createTime, status) values(2, 'user', '$2a$10$y81.5CFxh8lqAZIgIQj82OJcTcTCgeLy6H82BSGLTBpuuQDktnvG6', now(), 1);
insert into User(userId, username, password, createTime, status) values(3, 'guest', '$2a$10$y81.5CFxh8lqAZIgIQj82OJcTcTCgeLy6H82BSGLTBpuuQDktnvG6', now(), 1);

insert into role(roleId, roleName, createTime) values(1, '超级管理员', now());
insert into role(roleId, roleName, createTime) values(2, '普通用户', now());
insert into role(roleId, roleName, createTime) values(3, '访客', now());

insert into UserRole(userId, roleId) values(1, 1);
insert into UserRole(userId, roleId) values(2, 2);
insert into UserRole(userId, roleId) values(3, 3);

insert into Resource(resourceId, name, authorities) values
(1, '列表', 'GET:/test,GET:/test/list'),
(2, '新增', 'GET:/test/add'),
(3, '修改', 'GET:/test/edit'),
(4, '详细', 'GET:/test/detail');

-- admin: 拥有：1,2,3,4
-- user 拥有：1,4
-- guest 拥有：1
insert into RoleResource(roleId, resourceId) values
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 4),
(3, 1);