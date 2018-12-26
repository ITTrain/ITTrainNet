package com.ittedu.os.edu.service.impl.praise;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ittedu.os.edu.dao.praise.PraiseDao;
import com.ittedu.os.edu.entity.praise.Praise;
import com.ittedu.os.edu.entity.questions.Questions;
import com.ittedu.os.edu.entity.questions.QuestionsComment;
import com.ittedu.os.edu.service.article.ArticleService;
import com.ittedu.os.edu.service.comment.CommentService;
import com.ittedu.os.edu.service.praise.PraiseService;
import com.ittedu.os.edu.service.questions.QuestionsCommentService;
import com.ittedu.os.edu.service.questions.QuestionsService;

import java.util.HashMap;
import java.util.Map;

/**
 * 点赞服务接口实现
 *@author www.ittedu.com
 */
@Service("praiseService")
public class PraiseServiceImpl implements PraiseService {

	@Autowired
	private PraiseDao praiseDao;
	@Autowired
	private QuestionsService questionsService;
	@Autowired
	private QuestionsCommentService questionsCommentService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private CommentService commentService;
	
	
	@Override
	public Long addPraise(Praise praise) {
		//根据点赞目标 type 修改相应的 点赞总数
		//点赞类型 1问答点赞 2问答评论点赞
		int type=praise.getType();
		if(type==1){
			Questions questions=questionsService.getQuestionsById(praise.getTargetId());
			questions.setPraiseCount(questions.getPraiseCount()+1);
			questionsService.updateQuestions(questions);
		}else if (type==2) {
			QuestionsComment questionsComment=questionsCommentService.getQuestionsCommentById(praise.getTargetId());
			questionsComment.setPraiseCount(questionsComment.getPraiseCount()+1);
			questionsCommentService.updateQuestionsComment(questionsComment);
		}
		//点赞类型为3的是文章点赞
		if(type==3){
			Map<String,String> map = new HashMap<String,String>();
			map.put("num","+1");
			map.put("type", "praiseCount");
			map.put("articleId", praise.getTargetId()+"");
			articleService.updateArticleNum(map);
		}
		//点赞类型为4的是评论点赞
		if(type==4){
			Map<String,String> map = new HashMap<String,String>();
			map.put("num","+1");
			map.put("type", "praiseCount");
			map.put("commentId", praise.getTargetId()+"");
			commentService.updateCommentNum(map);
		}
		return praiseDao.addPraise(praise);
	}

	@Override
	public int queryPraiseCount(Praise praise) {
		return praiseDao.queryPraiseCount(praise);
	}

}
