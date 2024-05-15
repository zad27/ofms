package com.ruoyi.system.service.impl;


import com.alibaba.fastjson.JSON;
import com.ruoyi.framework.datasource.DBContextHolder;
import com.ruoyi.framework.datasource.DataSource;
import com.ruoyi.framework.datasource.DynamicDataSource;
import com.ruoyi.framework.datasource.mapper.DataSourceMapper;
import com.ruoyi.system.service.IDBChangeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DBChangeServiceImpl implements IDBChangeService {

    @Autowired
    DataSourceMapper dataSourceMapper;
    @Autowired
    private DynamicDataSource dynamicDataSource;
    @Override
    public List<DataSource> get() {
        return dataSourceMapper.get();
    }

    @Override
    public boolean changeDb(String datasourceId) {

        //默认切换到主数据源,进行整体资源的查找
        DBContextHolder.clearDataSource();

        List<DataSource> dataSourcesList = dataSourceMapper.get();


        for (DataSource dataSource : dataSourcesList) {
            if (dataSource.getId().equals(datasourceId)) {
                System.out.println(JSON.toJSONString(dataSource));
                System.out.println("需要使用的的数据源已经找到,datasourceId是：" + dataSource.getId());
                //创建数据源连接&检查 若存在则不需重新创建
                try {
                    dynamicDataSource.createDataSourceWithCheck(dataSource);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                //切换到该数据源
                DBContextHolder.setDataSource(dataSource.getId());
                return true;
            }
        }
        return false;
    }
}
