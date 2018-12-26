package com.ittedu.os.edu.service.impl.questions;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ittedu.os.edu.dao.questions.QuestionsTagRelationDao;
import com.ittedu.os.edu.entity.questions.QuestionsTagRelation;
import com.ittedu.os.edu.service.questions.QuestionsTagRelationService;

/**
* 问答和 问答标签的 关联表service层接口实现
* @author www.ittedu.com
*/
@Service("questionsTagRelationService")
public class QuestionsTagRelationServiceImpl implements QuestionsTagRelationService {

	@Autowired
	private QuestionsTagRelationDao questionsTagRelationDao;
	@Override
	public Long addQuestionsTagRelation(QuestionsTagRelation questionsTagRelation) {
		return questionsTagRelationDao.addQuestionsTagRelation(questionsTagRelation);
	}

	@Override
	public List<QuestionsTagRelation> queryQuestionsTagRelation(QuestionsTagRelation questionsTagRelation) {
		return questionsTagRelationDao.queryQuestionsTagRelation(questionsTagRelation);
	}

}
