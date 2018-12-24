package com.ittedu.os.edu.dao.impl.praise;

import org.springframework.stereotype.Repository;

import com.ittedu.os.common.dao.GenericDaoImpl;
import com.ittedu.os.edu.dao.praise.PraiseDao;
import com.ittedu.os.edu.entity.praise.Praise;

/**
 * @author www.inxedu.com
 *
 */
@Repository("praiseDao")
public class PraiseDaoImpl extends GenericDaoImpl implements PraiseDao {

	@Override
	public Long addPraise(Praise praise) {
		return this.insert("PraiseMapper.addPraise", praise);
	}

	@Override
	public int queryPraiseCount(Praise praise) {
		return this.selectOne("PraiseMapper.queryPraiseCount", praise);
	}

}
