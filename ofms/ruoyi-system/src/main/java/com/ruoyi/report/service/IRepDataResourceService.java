package com.ruoyi.report.service;

import java.util.List;
import com.ruoyi.report.domain.RepDataResource;

/**
 * 报数据源管理Service接口
 * 
 * @author Pekin
 * @date 2021-10-25
 */
public interface IRepDataResourceService 
{
    /**
     * 查询报数据源管理
     * 
     * @param id 报数据源管理主键
     * @return 报数据源管理
     */
    public RepDataResource selectRepDataResourceById(Long id);

    /**
     * 查询报数据源管理列表
     * 
     * @param repDataResource 报数据源管理
     * @return 报数据源管理集合
     */
    public List<RepDataResource> selectRepDataResourceList(RepDataResource repDataResource);

    /**
     * 新增报数据源管理
     * 
     * @param repDataResource 报数据源管理
     * @return 结果
     */
    public int insertRepDataResource(RepDataResource repDataResource);

    /**
     * 修改报数据源管理
     * 
     * @param repDataResource 报数据源管理
     * @return 结果
     */
    public int updateRepDataResource(RepDataResource repDataResource);

    /**
     * 批量删除报数据源管理
     * 
     * @param ids 需要删除的报数据源管理主键集合
     * @return 结果
     */
    public int deleteRepDataResourceByIds(Long[] ids);

    /**
     * 删除报数据源管理信息
     * 
     * @param id 报数据源管理主键
     * @return 结果
     */
    public int deleteRepDataResourceById(Long id);
}
