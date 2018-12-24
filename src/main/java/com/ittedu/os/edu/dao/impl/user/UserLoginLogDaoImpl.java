package com.ittedu.os.edu.dao.impl.user;

import java.util.List;

import com.ittedu.os.common.entity.PageEntity;
import com.ittedu.os.edu.dao.user.UserLoginLogDao;
import com.ittedu.os.edu.entity.user.UserLoginLog;

import org.springframework.stereotype.Repository;

import com.ittedu.os.common.dao.GenericDaoImpl;

/**
 * @author www.inxedu.com
 *
 */
@Repository("userLoginLogDao")
public class UserLoginLogDaoImpl extends GenericDaoImpl implements UserLoginLogDao {

	
	public int createLoginLog(UserLoginLog loginLog) {
		this.insert("UserLoginLogMapper.createLoginLog", loginLog);
		return loginLog.getLogId();
	}

	
	public List<UserLoginLog> queryUserLogPage(int userId, PageEntity page) {
		return this.queryForListPage("UserLoginLogMapper.queryUserLogPage", userId, page);
	}

}
