package com.ruoyi.system.service;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IExecSqlService {
    List<Map<String, Object>> execSelectBySql(@Param("sql") String sql);

    List<Map<String, Object>> getDataSourceList();

    List<Map<String, Object>> getTableList(String database);

    List<Map<String, Object>> getTableColnums(String database,String tablename);

    List<Map<String, Object>> runWithSql(String sql);
}
