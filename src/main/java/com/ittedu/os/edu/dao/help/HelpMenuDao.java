package com.ittedu.os.edu.dao.help;

import java.util.List;

import com.ittedu.os.edu.entity.help.HelpMenu;


/**
 * 帮助菜单
 * @author http://www.ittedu.com
 */
public interface HelpMenuDao {
	
	/**
	 * 查询所有一级菜单 
	 * @return HelpMenu
	 */
    public List<HelpMenu> getHelpMenuOne();
    /**
	 * 根据一级菜单ID查询二级菜单 
	 * @return HelpMenu
	 */
	public List<HelpMenu> getHelpMenuTwoByOne(Long id);
    /**
     * 删除菜单
     * @param id
     */
    public void delHelpMenuById(Long id);
    /**
     * 更新菜单
     */
    public void updateHelpMenuById(HelpMenu helpMenu);
    /**
     *  添加菜单
     * @return id
     */
    public Long createHelpMenu(HelpMenu helpMenu);
    /**
     * 根据ID查找菜单
     * @param id
     * @return
     */
    public HelpMenu getHelpMenuById(Long id);
}

