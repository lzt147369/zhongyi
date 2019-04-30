package com.zhongyi.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhongyi.admin.entity.Role;

import java.util.List;

public interface RoleService extends IService<Role> {

    long getRoleNameCount(String name);

    Role saveRole(Role role);

    Role getRoleById(String id);

    void updateRole(Role role);

    void deleteRole(Role role);

    List<Role> selectAll();
}
