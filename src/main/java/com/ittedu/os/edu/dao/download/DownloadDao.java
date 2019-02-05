package com.ittedu.os.edu.dao.download;


import java.util.List;

import com.ittedu.os.common.entity.PageEntity;
import com.ittedu.os.edu.entity.download.DownloadFile;
import com.ittedu.os.edu.entity.download.QueryDownloadFile;

/**
 * 文件下载dao层接口
 * @author www.ittedu.com
 */
public interface DownloadDao {

    /**
     * 分页查询文件列表
     * @param query 查询条件
     * @param page 分页条件
     * @return List<DownloadFile>
     */
    public List<DownloadFile> queryDownloadListPage(QueryDownloadFile query,PageEntity page);

    /**
     * 条件查询文件列表
     * @param queryDownloadFile 查询条件
     * @return List<DownloadFile>
     */
    public List<DownloadFile> queryDownloadList(QueryDownloadFile queryDownloadFile);


}