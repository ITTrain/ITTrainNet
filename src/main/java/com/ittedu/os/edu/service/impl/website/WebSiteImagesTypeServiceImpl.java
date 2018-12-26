package com.ittedu.os.edu.service.impl.website;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ittedu.os.edu.dao.website.WebSiteImagesTypeDao;
import com.ittedu.os.edu.entity.website.WebSiteImagesType;
import com.ittedu.os.edu.service.website.WebSiteImagesTypeService;

/**
 * @author www.ittedu.com
 *
 */
@Service("webSiteImagesTypeService")
public class WebSiteImagesTypeServiceImpl implements WebSiteImagesTypeService{
	
	@Autowired
	private WebSiteImagesTypeDao webSiteImagesTypeDao;
	
	public int createImageType(WebSiteImagesType type) {
		return webSiteImagesTypeDao.createImageType(type);
	}

	
	public List<WebSiteImagesType> queryAllTypeList() {
		return webSiteImagesTypeDao.queryAllTypeList();
	}

	
	public void deleteTypeById(int typeId) {
		webSiteImagesTypeDao.deleteTypeById(typeId);
	}

	
	public void updateType(WebSiteImagesType type) {
		webSiteImagesTypeDao.updateType(type);
	}

}
