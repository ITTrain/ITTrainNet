package com.ittedu.os.edu.entity.download;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 文件下载实体
 * @author www.ittedu.com
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class DownloadFile implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 838162101564081713L;
    private int fileId;// 主键自增
    private String fileUrl;// 文件路径
    private String fileName;// 文件名称
    private String type1;// 文件分类1
    private String type2;// 文件分类2
    private String title;// 文件下载标题
    private String authority;// 文件访问权限
    private java.util.Date createTime;// 创建时间
    private int subjectId;//文件下载所属ID
    private int clickNum;//文件下载量
    private int sort;//排序
}
