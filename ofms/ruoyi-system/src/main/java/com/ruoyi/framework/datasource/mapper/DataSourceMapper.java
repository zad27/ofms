package com.ruoyi.framework.datasource.mapper;

import com.ruoyi.framework.datasource.DataSource;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface DataSourceMapper {

    @Select("SELECT * FROM report_data_resource")
    List<DataSource> get();
}
