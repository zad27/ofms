package com.ruoyi.framework.datasource.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface ExecSqlMapper {

    @Select(" select * from report_data_resource ")
    List<Map<String, Object>> execSelectBySql(@Param("sql") String sql);

    /**
     * 获取数据源管理配置列表
     * @return
     */
    @Select(" select id,connType,connName,connDbName from report_data_resource ")
    List<Map<String, Object>> getDataSourceList();

    @Select("SELECT\n" +
            "table_name name,TABLE_COMMENT VALUE \n" +
            "FROM INFORMATION_SCHEMA.TABLES a \n" +
            "WHERE a.table_schema= #{database}  \n" +
            "AND table_type='BASE TABLE'")
    List<Map<String, Object>> getTableList(@Param("database") String database);

    @Select("select\n" +
            "ORDINAL_POSITION as Colorder,\n" +
            "Column_Name as ColumnName,data_type as TypeName,\n" +
            "COLUMN_COMMENT as DeText,\n" +
            "(case when data_type IN ( 'float','double', 'decimal') then NUMERIC_PRECISION else CHARACTER_MAXIMUM_LENGTH end ) as length,\n" +
            "NUMERIC_SCALE as Scale,\n" +
            "( case when EXTRA='auto_increment' then 1 else 0 end) as IsIdentity,\n" +
            "(case when COLUMN_KEY='PRI' then 1 else 0 end) as IsPK,\n" +
            "(case when IS_NULLABLE = 'NO' then 0 else 1 END) as CanNull,\n" +
            "COLUMN_DEFAULT as DefaultVal\n" +
            "from information_schema.columns\n" +
            "where table_schema =  #{database} and table_name =  #{tablename} order by ORDINAL_POSITION asc")
    List<Map<String, Object>> getTableColnums(@Param("database") String database,@Param("tablename") String tablename);

    @Select("<script>  <![CDATA[ ${sql} ]]>  </script>")
    List<Map<String, Object>> runWithSql(@Param("sql")String sql);
}
