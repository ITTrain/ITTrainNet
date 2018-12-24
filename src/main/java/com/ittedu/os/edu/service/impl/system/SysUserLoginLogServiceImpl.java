package com.ittedu.os.edu.service.impl.system;

import com.ittedu.os.common.entity.PageEntity;
import com.ittedu.os.edu.dao.system.SysUserLoginLogDao;
import com.ittedu.os.edu.entity.system.SysUserLoginLog;
import com.ittedu.os.edu.service.system.SysUserLoginLogService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 后台用户登录日志
 * @author www.inxedu.com
 */
@Service("sysUserLoginLogService")
public class SysUserLoginLogServiceImpl implements SysUserLoginLogService{

	@Autowired
	private SysUserLoginLogDao sysUserLoginLogDao;
	
	public int createLoginLog(SysUserLoginLog loginLog) {
		return sysUserLoginLogDao.createLoginLog(loginLog);
	}
	
	public List<SysUserLoginLog> queryUserLogPage(int userId, PageEntity page) {
		return sysUserLoginLogDao.queryUserLogPage(userId, page);
	}

}
