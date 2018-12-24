package com.ittedu.os.edu.dao.impl.websiteehcache;

import com.ittedu.os.common.dao.GenericDaoImpl;
import com.ittedu.os.common.entity.PageEntity;
import com.ittedu.os.edu.dao.websiteehcache.WebsiteEhcacheDao;
import com.ittedu.os.edu.entity.websiteehcache.WebsiteEhcache;

import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 缓存管理
 * @author www.inxedu.com
 *
 */
@Repository("websiteEhcacheDao")
public class WebsiteEhcacheDaoImpl extends GenericDaoImpl implements WebsiteEhcacheDao {

	public void addWebsiteEhcache(WebsiteEhcache websiteEhcache) {
		this.insert("WebsiteEhcacheMapper.addWebsiteEhcache", websiteEhcache);
	}
	
	public List<WebsiteEhcache> queryWebsiteEhcacheList(WebsiteEhcache websiteEhcache, PageEntity page) {
		return this.queryForListPage("WebsiteEhcacheMapper.queryWebsiteEhcacheList", websiteEhcache, page);
	}


	public Long delWebsiteEhcache(Long id) {
		return this.delete("WebsiteEhcacheMapper.delWebsiteEhcache", id);
	}

	public WebsiteEhcache getWebsiteEhcacheById(Long id) {
		return this.selectOne("WebsiteEhcacheMapper.getWebsiteEhcacheById", id);
	}

	public int queryWebsiteEhcacheIsExsit(String key) {
		return this.selectOne("WebsiteEhcacheMapper.queryWebsiteEhcacheIsExsit", key);
	}

	public Long updateWebsiteEhcache(WebsiteEhcache websiteEhcache) {
		return this.update("WebsiteEhcacheMapper.updateWebsiteEhcache", websiteEhcache);
	}

}
