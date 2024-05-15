package com.ruoyi.system.service;

import com.ruoyi.framework.datasource.DataSource;

import java.util.List;

public interface IDBChangeService {
    List<DataSource> get();

    boolean changeDb(String datasourceId);
}
