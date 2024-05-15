package com.ruoyi.system.service.impl;

import com.ruoyi.framework.datasource.mapper.ExecSqlMapper;
import com.ruoyi.system.service.IExecSqlService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ExecSqlServiceImpl implements IExecSqlService {
    @Autowired
    ExecSqlMapper execSqlMapper;

    @Override
    public List<Map<String, Object>> execSelectBySql(String sql) {
        return execSqlMapper.execSelectBySql(sql);
    }

    @Override
    public List<Map<String, Object>> getDataSourceList() {
        return execSqlMapper.getDataSourceList();
    }

    @Override
    public List<Map<String, Object>> getTableList(String database){
        return execSqlMapper.getTableList(database);
    }


    @Override
    public List<Map<String, Object>> getTableColnums(String database,String tablename){
        return execSqlMapper.getTableColnums(database,tablename);
    }

    @Override
    public List<Map<String, Object>> runWithSql(String sql) {
        return execSqlMapper.runWithSql(sql);
    }
}
