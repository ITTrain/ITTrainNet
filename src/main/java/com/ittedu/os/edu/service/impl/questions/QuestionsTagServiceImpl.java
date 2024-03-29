package com.ittedu.os.edu.service.impl.questions;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ittedu.os.edu.dao.questions.QuestionsTagDao;
import com.ittedu.os.edu.entity.questions.QuestionsTag;
import com.ittedu.os.edu.service.questions.QuestionsTagService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 专业service实现
 * @author www.ittedu.com
 */
@Service("questionsTagService")
public class QuestionsTagServiceImpl implements QuestionsTagService {

    @Autowired
    private QuestionsTagDao questionsTagDao;

	
	public int createQuestionsTag(QuestionsTag questionsTag) {
		return questionsTagDao.createQuestionsTag(questionsTag);
	}

	
	public List<QuestionsTag> getQuestionsTagList(QuestionsTag query) {
		return questionsTagDao.getQuestionsTagList(query);
	}

	
	public void updateQuestionsTagParentId(int questionsTagId, int parentId) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("questionsTagId", questionsTagId);
		map.put("parentId", parentId);
		questionsTagDao.updateQuestionsTagParentId(map);
	}

	
	public void updateQuestionsTag(QuestionsTag questionsTag) {
		questionsTagDao.updateQuestionsTag(questionsTag);
	}

	
	public void deleteQuestionsTag(int questionsTagId) {
		questionsTagDao.deleteQuestionsTag(questionsTagId);
	}
}
