package com.ruoyi.web.controller.report;

import com.alibaba.druid.DbType;
import com.alibaba.druid.sql.SQLUtils;
import com.alibaba.druid.sql.ast.SQLStatement;
import com.alibaba.fastjson.JSON;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.framework.datasource.DBContextHolder;
import com.ruoyi.system.service.IDBChangeService;
import com.ruoyi.system.service.IExecSqlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * 生成报表视图过程
 */
@RestController
@RequestMapping("/report/prebuild")
public class preReportControlller {
    @Autowired
    private IDBChangeService dbChangeService;

    @Autowired
    private IExecSqlService execSqlService;

    @GetMapping("/getdatasource")
    public AjaxResult getDataSource(){
        List<Map<String, Object>> maps = execSqlService.getDataSourceList();
        System.out.println("=======>"+JSON.toJSONString(maps));
        return AjaxResult.success(maps);
    }

    @GetMapping("/getTableList")
    public AjaxResult getTableList(String datasourceid, String database){
        //切换到数据库
        dbChangeService.changeDb(datasourceid);
        List<Map<String, Object>> maps = execSqlService.getTableList(database);
        System.out.println("=======>"+JSON.toJSONString(maps));
        //切回主数据源
        DBContextHolder.clearDataSource();
        return AjaxResult.success(maps);
    }

    @GetMapping("/getTableColnums")
    public AjaxResult getTableColnums(String datasourceid, String database,String tablename){
        //切换到数据库
        dbChangeService.changeDb(datasourceid);
        List<Map<String, Object>> maps = execSqlService.getTableColnums(database,tablename);
        System.out.println("=======>"+JSON.toJSONString(maps));
        //切回主数据源
        DBContextHolder.clearDataSource();
        return AjaxResult.success(maps);
    }

    @GetMapping("/runWithSql")
    public AjaxResult runWithSql(String datasourceid, String database,String sql){
        //切换到数据库
        dbChangeService.changeDb(datasourceid);
        System.out.println("RunWithSql:    "+sql);
        List<Map<String, Object>> maps = execSqlService.runWithSql(sql);
        System.out.println("=======>"+JSON.toJSONString(maps));
        //切回主数据源
        DBContextHolder.clearDataSource();
        return AjaxResult.success(maps);
    }

    @GetMapping("/checkWithSql")
    public AjaxResult checkWithSql(String type,String sql){
        System.out.println("type:"+type);
        System.out.println("checkWithSql:    "+sql);
        DbType dbtype=DbType.valueOf(type.toLowerCase());
        try{
            List<SQLStatement> statementList2 = SQLUtils.parseStatements(sql, dbtype);
//            for (SQLStatement sqlStatement : statementList2) {
//                System.out.println(sqlStatement);
//            }

            if(statementList2!=null){
                return AjaxResult.success(true);
            }else{
                return AjaxResult.success(false);
            }
        }catch (Exception e){

//            log.error("解析SQL失败{},原因：{}",sql,e);
            return AjaxResult.success(false);
        }
    }
}
