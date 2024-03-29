package com.ittedu.os.edu.service.letter;

import java.util.Date;
import java.util.List;

import com.ittedu.os.common.entity.PageEntity;
import com.ittedu.os.edu.entity.letter.MsgSystem;

/**
 * @author :
 * @ClassName com.ittedu.os.sns.service.letter.MsgSenderService
 * @description 站内信的发件箱service
 * @Create Date : 2014-1-26 下午1:53:44
 * @author www.ittedu.com
 */
public interface MsgSystemService {

    /**
     * 添加系统消息
     *
     * @param msgSystem
     * @return
     * @throws Exception
     */
    public Long addMsgSystem(MsgSystem msgSystem) throws Exception;

    /**
     * 查询系统消息
     *
     * @param msgSystem
     * @return
     * @throws Exception
     */
    public List<MsgSystem> queryMsgSystemList(MsgSystem msgSystem, PageEntity page) throws Exception;

    /**
     * 通过id删除系统消息
     *
     * @return
     * @throws Exception
     */
    public void delMsgSystemById(String ids) throws Exception;


    /**
     * 查询大于传入的时间的系统系统消息
     * @return
     * @throws Exception
     */
    public List<MsgSystem> queryMSListByLT(Date lastTime) throws Exception;

    /**
     * 检查系统消息过期更新字段 删除过期的站内信
     * @return
     * @throws Exception
     */
    public void updatePast() throws Exception;

}
