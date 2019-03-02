package com.ittedu.os.edu.dao.impl.itJapanese;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.ittedu.os.common.dao.GenericDaoImpl;
import com.ittedu.os.common.entity.PageEntity;
import com.ittedu.os.edu.dao.itJapanese.ITJapaneseDao;
import com.ittedu.os.edu.entity.itJapanese.ITJapaneseWords;
import com.ittedu.os.edu.entity.itJapanese.QueryITJapanese;

/**
 * IT日语dao层
 * @author www.ittedu.com
 */
@Repository("iTJapaneseDao")
public class ITJapaneseDaoImpl extends GenericDaoImpl implements ITJapaneseDao {

	public List<ITJapaneseWords> queryITJapaneseWordsPage(QueryITJapanese query, PageEntity page) {
		return this.queryForListPageCount("ITJapaneseMapper.queryITJapaneseWordsPage", query, page);
	}


	public List<ITJapaneseWords> queryJapaneseWords(QueryITJapanese queryITJapanese) {
		return this.selectList("ITJapaneseMapper.queryJapaneseWords", queryITJapanese);
	}
}
