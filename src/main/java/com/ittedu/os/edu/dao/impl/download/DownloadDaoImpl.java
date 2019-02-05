package com.ittedu.os.edu.dao.impl.download;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.ittedu.os.common.dao.GenericDaoImpl;
import com.ittedu.os.common.entity.PageEntity;
import com.ittedu.os.edu.dao.download.DownloadDao;
import com.ittedu.os.edu.entity.download.DownloadFile;
import com.ittedu.os.edu.entity.download.QueryDownloadFile;

/**
 * 文件下载dao层
 * @author www.ittedu.com
 */
@Repository("downloadDao")
public class DownloadDaoImpl extends GenericDaoImpl implements DownloadDao {

	public List<DownloadFile> queryDownloadListPage(QueryDownloadFile query, PageEntity page) {
		return this.queryForListPageCount("DownloadMapper.queryDownloadListPage", query, page);
	}


	public List<DownloadFile> queryDownloadList(QueryDownloadFile queryDownloadFile) {
		return this.selectList("DownloadMapper.queryDownloadList", queryDownloadFile);
	}
}
