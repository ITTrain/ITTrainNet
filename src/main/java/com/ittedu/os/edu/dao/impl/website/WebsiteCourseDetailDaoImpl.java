package com.ittedu.os.edu.dao.impl.website;


import java.util.List;
import java.util.Map;

import com.ittedu.os.common.entity.PageEntity;
import com.ittedu.os.edu.dao.website.WebsiteCourseDetailDao;
import com.ittedu.os.edu.entity.website.WebsiteCourseDetail;
import com.ittedu.os.edu.entity.website.WebsiteCourseDetailDTO;

import org.springframework.stereotype.Repository;

import com.ittedu.os.common.dao.GenericDaoImpl;

/**
 *
 * 推荐课程关联Dao层
 * @author www.ittedu.com
 */
 @Repository("websiteCourseDetailDao")
public class WebsiteCourseDetailDaoImpl extends GenericDaoImpl implements WebsiteCourseDetailDao {

	
	public void createWebsiteCourseDetail(String detail) {
		this.insert("WebsiteCourseDetailMapper.createWebsiteCourseDetail", detail);
	}

	
	public List<WebsiteCourseDetailDTO> queryCourseDetailPage(WebsiteCourseDetailDTO dto, PageEntity page) {
		return this.queryForListPage("WebsiteCourseDetailMapper.queryCourseDetailPage", dto, page);
	}

	
	public void deleteDetailById(int id) {
		this.delete("WebsiteCourseDetailMapper.deleteDetailById", id);
	}

	
	public void updateSort(Map<String, Integer> map) {
		this.update("WebsiteCourseDetailMapper.updateSort", map);
	}

	
	public List<WebsiteCourseDetail> queryDetailListByrecommendId(int recommendId) {
		return this.selectList("WebsiteCourseDetailMapper.queryDetailListByrecommendId", recommendId);
	}
}
