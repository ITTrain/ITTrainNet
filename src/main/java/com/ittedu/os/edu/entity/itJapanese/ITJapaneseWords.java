package com.ittedu.os.edu.entity.itJapanese;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * IT日语
 * @author www.ittedu.com
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class ITJapaneseWords implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 838162101564081713L;
    private int word_id;// 主键自增
    private String lesson;// 所属课程
    private String kana;// 假名
    private String kanji;// 汉字
    private String word_type;// 词性
    private String english;// 英语词义
    private String chinese;// 汉语词义
    private String type1;//领域分类1
    private String type2;//领域分类2
    private int displayFlg;//显示标识
    private int subjectId;//文件下载所属ID
}
