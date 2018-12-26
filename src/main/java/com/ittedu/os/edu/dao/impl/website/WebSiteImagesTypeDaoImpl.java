package com.ittedu.os.edu.dao.impl.website;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ittedu.os.common.dao.GenericDaoImpl;
import com.ittedu.os.edu.dao.website.WebSiteImagesTypeDao;
import com.ittedu.os.edu.entity.website.WebSiteImagesType;

/**
 * @author www.ittedu.com
 *
 */
@Repository("webSiteImagesTypeDao")
public class WebSiteImagesTypeDaoImpl extends GenericDaoImpl implements WebSiteImagesTypeDao{

	
	public int createImageType(WebSiteImagesType type) {
		this.insert("WebSiteImagesTypeMapper.createImageType", type);
		return type.getTypeId();
	}

	
	public List<WebSiteImagesType> queryAllTypeList() {
		return this.selectList("WebSiteImagesTypeMapper.queryAllTypeList", null);
	}

	
	public void deleteTypeById(int typeId) {
		this.delete("WebSiteImagesTypeMapper.deleteTypeById", typeId);
	}

	
	public void updateType(WebSiteImagesType type) {
		this.update("WebSiteImagesTypeMapper.updateType", type);
	}

}
