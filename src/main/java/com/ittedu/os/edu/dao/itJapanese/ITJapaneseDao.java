package com.ittedu.os.edu.dao.itJapanese;


import java.util.List;

import com.ittedu.os.common.entity.PageEntity;
import com.ittedu.os.edu.entity.itJapanese.ITJapaneseWords;
import com.ittedu.os.edu.entity.itJapanese.QueryITJapanese;

/**
 * IT日语dao层接口
 * @author www.ittedu.com
 */
public interface ITJapaneseDao {

    /**
     * 分页查询列表
     * @param query 查询条件
     * @param page 分页条件
     * @return List<ITJapaneseWords>
     */
    public List<ITJapaneseWords> queryITJapaneseWordsPage(QueryITJapanese query,PageEntity page);

    /**
     * 条件查询列表
     * @param queryITJapanese 查询条件
     * @return List<ITJapaneseWords>
     */
    public List<ITJapaneseWords> queryJapaneseWords(QueryITJapanese queryITJapanese);


}