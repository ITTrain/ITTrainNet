package com.ittedu.os.edu.service.user;

import com.ittedu.os.common.entity.PageEntity;
import com.ittedu.os.edu.entity.user.UserLoginLog;

import java.util.List;

/**
 * 前台学员登录日志
 * @author www.ittedu.com
 *
 */
public interface UserLoginLogService {
	/**
	 * 添加登录日志
	 * @param loginLog
	 * @return 日志ID
	 */
	public int createLoginLog(UserLoginLog loginLog);
	
	/**
	 * 查询用户登录日志
	 * @param userId 用户ID
	 * @param page 分页条件
	 * @return List<UserLoginLog>
	 */
	public List<UserLoginLog> queryUserLogPage(int userId,PageEntity page);
}
