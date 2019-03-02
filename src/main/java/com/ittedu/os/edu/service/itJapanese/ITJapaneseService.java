package com.ittedu.os.edu.service.itJapanese;

import java.util.List;

import com.ittedu.os.common.entity.PageEntity;
import com.ittedu.os.edu.entity.itJapanese.ITJapaneseWords;
import com.ittedu.os.edu.entity.itJapanese.QueryITJapanese;

/**
 * IT日语管理接口
 * @author www.ittedu.com
 */
public interface ITJapaneseService {

	/**
     * 分页查询列表
     */
    public List<ITJapaneseWords> queryITJapaneseWordsPage(QueryITJapanese query,PageEntity page);

	/**
     * 条件查询列表
     */
    public List<ITJapaneseWords> queryJapaneseWords(QueryITJapanese queryITJapanese);
}