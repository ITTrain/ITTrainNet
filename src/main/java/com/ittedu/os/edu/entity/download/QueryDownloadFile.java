package com.ittedu.os.edu.entity.download;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 下载文件 查询辅助类
 * @author www.ittedu.com
 *
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class QueryDownloadFile implements Serializable{
    private static final long serialVersionUID = -2260935476109762530L;
    private String fileName;	//文件名称
//    private int isStar;	//
    private int subjectId;//文件下载所属分类
    private int count;//数量
    private int fileId;

	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date beginCreateTime;//查询 开始时间
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date endCreateTime;//查询 结束时间
}
