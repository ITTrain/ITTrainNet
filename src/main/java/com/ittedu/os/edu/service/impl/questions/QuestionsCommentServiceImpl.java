package com.ittedu.os.edu.service.impl.questions;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ittedu.os.common.entity.PageEntity;
import com.ittedu.os.edu.dao.questions.QuestionsCommentDao;
import com.ittedu.os.edu.entity.questions.QuestionsComment;
import com.ittedu.os.edu.service.questions.QuestionsCommentService;

/**
 * @author www.ittedu.com
 *
 */
@Service("questionsCommentService")
public class QuestionsCommentServiceImpl implements QuestionsCommentService {

	@Autowired
	private QuestionsCommentDao questionsCommentDao;
	
	@Override
	public Long addQuestionsComment(QuestionsComment questionsComment) {
		return questionsCommentDao.addQuestionsComment(questionsComment);
		
	}

	@Override
	public Long deleteQuestionsCommentById(Long id) {
		return questionsCommentDao.deleteQuestionsCommentById(id);
	}
	
	@Override
	public QuestionsComment getQuestionsCommentById(Long id) {
		return questionsCommentDao.getQuestionsCommentById(id);
	}

	@Override
	public void updateQuestionsComment(QuestionsComment questionsComment) {
		questionsCommentDao.updateQuestionsComment(questionsComment);
	}

	@Override
	public List<QuestionsComment> getQuestionsCommentList(QuestionsComment questionsComment) {
		return questionsCommentDao.getQuestionsCommentList(questionsComment);
	}

	@Override
	public List<QuestionsComment> queryQuestionsCommentListByQuestionsId(QuestionsComment questionsComment,
			PageEntity page) {
		return questionsCommentDao.queryQuestionsCommentListByQuestionsId(questionsComment,page);
	}

	@Override
	public Long delQuestionsCommentByQuestionId(Long id) {
		return questionsCommentDao.delQuestionsCommentByQuestionId(id);
	}

	@Override
	public List<QuestionsComment> queryQuestionsCommentList(QuestionsComment questionsComment, PageEntity page) {
		return questionsCommentDao.queryQuestionsCommentList(questionsComment,page);
	}

	@Override
	public Long delQuestionsCommentByCommentId(Long commentId) {
		return questionsCommentDao.delQuestionsCommentByCommentId(commentId);
	}

}
