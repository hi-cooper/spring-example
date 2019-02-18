use spring_security_demo;

-- init User
-- 密码： 123456
insert into User(id, username, password, status) values(1, 'admin', '$2a$10$co4K58krskKumA9h7f3wKepkNWsAPFG/EyZlLBJs6oKTFGcF0Bzg6', 1);
insert into User(id, username, password, status) values(2, 'guest', '$2a$10$co4K58krskKumA9h7f3wKepkNWsAPFG/EyZlLBJs6oKTFGcF0Bzg6', 1);
insert into User(id, username, password, status) values(3, 'test', '$2a$10$co4K58krskKumA9h7f3wKepkNWsAPFG/EyZlLBJs6oKTFGcF0Bzg6', 1);

-- init Resource
-- 菜单资源
insert into Resource(id, parentId, name, type, method, url, authorities) values(1, null, '系统管理', 1, null, null, null);
insert into Resource(id, parentId, name, type, method, url, authorities) values(2, 1, '用户管理', 1, 'GET', '/users', 'GET:/users,GET:/users/list');
insert into Resource(id, parentId, name, type, method, url, authorities) values(3, 2, '新增', 1, 'POST', '/users', 'POST:/users');
insert into Resource(id, parentId, name, type, method, url, authorities) values(4, 2, '修改', 1, 'PUT', '/users', 'PUT:/users');
insert into Resource(id, parentId, name, type, method, url, authorities) values(5, 1, '角色管理', 1, 'GET', '/roles', 'GET:/roles,GET:/roles/list');
-- API
insert into Resource(id, parentId, name, type, method, url, authorities) values(6, null, '获取用户名称', 3, 'GET', '/api/v1/getUsername', 'GET:/api/v1/getUsername');
insert into Resource(id, parentId, name, type, method, url, authorities) values(7, null, '获取用户信息', 3, 'GET', '/api/v1/getUserInfo', 'GET:/api/v1/getUserInfo');

-- init Role
insert into Role(id, name) values(1, '管理员');
insert into Role(id, name) values(2, '访客');
insert into Role(id, name) values(3, '测试');

-- init UserRole
insert into UserRole(userId, roleId) values(1, 1);
insert into UserRole(userId, roleId) values(2, 2);
insert into UserRole(userId, roleId) values(3, 3);

-- init RoleResource
-- 管理员
insert into RoleResource(roleId, resourceId) values(1, 1);
insert into RoleResource(roleId, resourceId) values(1, 2);
insert into RoleResource(roleId, resourceId) values(1, 3);
insert into RoleResource(roleId, resourceId) values(1, 4);
insert into RoleResource(roleId, resourceId) values(1, 5);
insert into RoleResource(roleId, resourceId) values(1, 6);
insert into RoleResource(roleId, resourceId) values(1, 7);
-- 访客
insert into RoleResource(roleId, resourceId) values(2, 1);
insert into RoleResource(roleId, resourceId) values(2, 2);
insert into RoleResource(roleId, resourceId) values(2, 5);
-- 测试
insert into RoleResource(roleId, resourceId) values(3, 6);
insert into RoleResource(roleId, resourceId) values(3, 7);
