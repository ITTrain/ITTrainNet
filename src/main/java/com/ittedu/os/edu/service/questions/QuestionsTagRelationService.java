package com.ittedu.os.edu.service.questions;

import java.util.List;

import com.ittedu.os.edu.entity.questions.QuestionsTagRelation;

/**
* 问答和 问答标签的 关联表service层接口
* @author www.ittedu.com
*/
public interface QuestionsTagRelationService {
	/**
	 * 添加
	 * @param questionsTagRelation
	 * @return
	 */
	public Long addQuestionsTagRelation(QuestionsTagRelation questionsTagRelation);
	
	/**
	 * 查询
	 */
	public List<QuestionsTagRelation> queryQuestionsTagRelation(QuestionsTagRelation questionsTagRelation);
}
