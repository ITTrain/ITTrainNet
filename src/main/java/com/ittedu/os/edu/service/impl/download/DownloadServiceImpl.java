package com.ittedu.os.edu.service.impl.download;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ittedu.os.common.entity.PageEntity;
import com.ittedu.os.edu.dao.download.DownloadDao;
import com.ittedu.os.edu.entity.download.DownloadFile;
import com.ittedu.os.edu.entity.download.QueryDownloadFile;
import com.ittedu.os.edu.service.download.DownloadService;

/**
 * Download管理接口
 * @author www.ittedu.com
 */
@Service("downloadService")
public class DownloadServiceImpl implements DownloadService {
	@Autowired
	private DownloadDao downloadDao;

	public List<DownloadFile> queryDownloadListPage(QueryDownloadFile query, PageEntity page) {
		return downloadDao.queryDownloadListPage(query, page);
	}

	public List<DownloadFile> queryDownloadList(QueryDownloadFile queryDownload) {
		return downloadDao.queryDownloadList(queryDownload);
	}
}