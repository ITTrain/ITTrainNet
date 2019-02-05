package com.ittedu.os.edu.service.download;

import java.util.List;

import com.ittedu.os.common.entity.PageEntity;
import com.ittedu.os.edu.entity.download.DownloadFile;
import com.ittedu.os.edu.entity.download.QueryDownloadFile;

/**
 * Download管理接口
 * @author www.ittedu.com
 */
public interface DownloadService {

	/**
     * 分页查询文件列表
     */
    public List<DownloadFile> queryDownloadListPage(QueryDownloadFile query,PageEntity page);

	/**
     * 条件查询文件列表
     */
    public List<DownloadFile> queryDownloadList(QueryDownloadFile queryDownloadFile);
}