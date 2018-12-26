package com.ittedu.os.edu.dao.praise;

import com.ittedu.os.edu.entity.praise.Praise;

/**
 * 点赞管理接口
 *@author www.ittedu.com
 */
public interface PraiseDao {
	/**
	 * 添加点赞记录
	 */
	public Long addPraise(Praise praise);
	
	/**
	 * 根据条件查询点赞数
	 */
	public int queryPraiseCount(Praise praise);
}
