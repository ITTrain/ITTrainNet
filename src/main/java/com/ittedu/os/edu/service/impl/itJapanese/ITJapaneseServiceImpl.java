package com.ittedu.os.edu.service.impl.itJapanese;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ittedu.os.common.entity.PageEntity;
import com.ittedu.os.edu.dao.itJapanese.ITJapaneseDao;
import com.ittedu.os.edu.entity.itJapanese.ITJapaneseWords;
import com.ittedu.os.edu.entity.itJapanese.QueryITJapanese;
import com.ittedu.os.edu.service.itJapanese.ITJapaneseService;

/**
 * IT日语管理接口
 * @author www.ittedu.com
 */
@Service("iTJapaneseService")
public class ITJapaneseServiceImpl implements ITJapaneseService {
	@Autowired
	private ITJapaneseDao iTJapaneseDao;

	public List<ITJapaneseWords> queryITJapaneseWordsPage(QueryITJapanese query, PageEntity page) {
		return iTJapaneseDao.queryITJapaneseWordsPage(query, page);
	}

	public List<ITJapaneseWords> queryJapaneseWords(QueryITJapanese queryITJapanese) {
		return iTJapaneseDao.queryJapaneseWords(queryITJapanese);
	}
}