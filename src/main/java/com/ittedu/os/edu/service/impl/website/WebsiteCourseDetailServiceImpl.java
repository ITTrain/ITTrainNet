package com.ittedu.os.edu.service.impl.website;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ittedu.os.common.cache.EHCacheUtil;
import com.ittedu.os.common.entity.PageEntity;
import com.ittedu.os.common.constants.CacheConstans;
import com.ittedu.os.edu.dao.website.WebsiteCourseDetailDao;
import com.ittedu.os.edu.entity.website.WebsiteCourseDetail;
import com.ittedu.os.edu.entity.website.WebsiteCourseDetailDTO;
import com.ittedu.os.edu.service.website.WebsiteCourseDetailService;

/**
 * 推荐课程关联接口实现
 * @author www.inxedu.com
 */
@Service("websiteCourseDetailService")
public class WebsiteCourseDetailServiceImpl implements WebsiteCourseDetailService {
	@Autowired
	private WebsiteCourseDetailDao websiteCourseDetailDao;
	
	public void createWebsiteCourseDetail(String detail) {
		websiteCourseDetailDao.createWebsiteCourseDetail(detail);
		EHCacheUtil.remove(CacheConstans.RECOMMEND_COURSE);
	}

	
	public List<WebsiteCourseDetailDTO> queryCourseDetailPage(WebsiteCourseDetailDTO dto, PageEntity page) {
		return websiteCourseDetailDao.queryCourseDetailPage(dto, page);
	}

	
	public void deleteDetailById(int id) {
		websiteCourseDetailDao.deleteDetailById(id);
		EHCacheUtil.remove(CacheConstans.RECOMMEND_COURSE);
	}

	
	public void updateSort(int id, int sort) {
		Map<String,Integer> map =new HashMap<String, Integer>();
		map.put("id", id);
		map.put("sort", sort);
		websiteCourseDetailDao.updateSort(map);
		EHCacheUtil.remove(CacheConstans.RECOMMEND_COURSE);
	}

	
	public List<WebsiteCourseDetail> queryDetailListByrecommendId(int recommendId) {
		return websiteCourseDetailDao.queryDetailListByrecommendId(recommendId);
	}
}