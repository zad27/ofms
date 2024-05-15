package com.ruoyi.report.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.report.mapper.RepDataResourceMapper;
import com.ruoyi.report.domain.RepDataResource;
import com.ruoyi.report.service.IRepDataResourceService;

/**
 * 报数据源管理Service业务层处理
 * 
 * @author Pekin
 * @date 2021-10-25
 */
@Service
public class RepDataResourceServiceImpl implements IRepDataResourceService 
{
    @Autowired
    private RepDataResourceMapper repDataResourceMapper;

    /**
     * 查询报数据源管理
     * 
     * @param id 报数据源管理主键
     * @return 报数据源管理
     */
    @Override
    public RepDataResource selectRepDataResourceById(Long id)
    {
        return repDataResourceMapper.selectRepDataResourceById(id);
    }

    /**
     * 查询报数据源管理列表
     * 
     * @param repDataResource 报数据源管理
     * @return 报数据源管理
     */
    @Override
    public List<RepDataResource> selectRepDataResourceList(RepDataResource repDataResource)
    {
        return repDataResourceMapper.selectRepDataResourceList(repDataResource);
    }

    /**
     * 新增报数据源管理
     * 
     * @param repDataResource 报数据源管理
     * @return 结果
     */
    @Override
    public int insertRepDataResource(RepDataResource repDataResource)
    {
        return repDataResourceMapper.insertRepDataResource(repDataResource);
    }

    /**
     * 修改报数据源管理
     * 
     * @param repDataResource 报数据源管理
     * @return 结果
     */
    @Override
    public int updateRepDataResource(RepDataResource repDataResource)
    {
        return repDataResourceMapper.updateRepDataResource(repDataResource);
    }

    /**
     * 批量删除报数据源管理
     * 
     * @param ids 需要删除的报数据源管理主键
     * @return 结果
     */
    @Override
    public int deleteRepDataResourceByIds(Long[] ids)
    {
        return repDataResourceMapper.deleteRepDataResourceByIds(ids);
    }

    /**
     * 删除报数据源管理信息
     * 
     * @param id 报数据源管理主键
     * @return 结果
     */
    @Override
    public int deleteRepDataResourceById(Long id)
    {
        return repDataResourceMapper.deleteRepDataResourceById(id);
    }
}
