package com.ruoyi.report.controller;

import java.sql.SQLException;
import java.util.List;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidPooledConnection;
import com.alibaba.fastjson.JSON;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.report.domain.RepDataResource;
import com.ruoyi.report.service.IRepDataResourceService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 报数据源管理Controller
 *
 * @author Pekin
 * @date 2021-10-25
 */
@RestController
@RequestMapping("/report/resource")
public class RepDataResourceController extends BaseController
{
    @Autowired
    private IRepDataResourceService repDataResourceService;

    /**
     * 查询报表数据源管理列表
     */
    @PreAuthorize("@ss.hasPermi('report:resource:list')")
    @GetMapping("/list")
    public TableDataInfo list(RepDataResource repDataResource)
    {
        startPage();
        List<RepDataResource> list = repDataResourceService.selectRepDataResourceList(repDataResource);
        return getDataTable(list);
    }

    /**
     * 导出报表数据源管理列表
     */
    @PreAuthorize("@ss.hasPermi('report:resource:export')")
    @Log(title = "报表数据源管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(RepDataResource repDataResource)
    {
        List<RepDataResource> list = repDataResourceService.selectRepDataResourceList(repDataResource);
        ExcelUtil<RepDataResource> util = new ExcelUtil<RepDataResource>(RepDataResource.class);
        return util.exportExcel(list, "报数据源管理数据");
    }

    /**
     * 获取报表数据源管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('report:resource:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(repDataResourceService.selectRepDataResourceById(id));
    }

    /**
     * 获取报表数据源管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('report:resource:list')")
    @GetMapping(value = "/test")
    public AjaxResult testConn(RepDataResource repDataResource) throws SQLException {

        System.out.println("====>"+ JSON.toJSONString(repDataResource) );
        DruidDataSource dataSource = new DruidDataSource();

        try {
            dataSource.setDriverClassName(repDataResource.getConndriverclass());
            String url ="";
            if(repDataResource.getConntype().equalsIgnoreCase("mysql")) {
                url = "jdbc:mysql://" + repDataResource.getConnip() + ":" + repDataResource.getConnport() + "/" + repDataResource.getConndbname();
            }
            dataSource.setUrl(url);
            dataSource.setUsername(repDataResource.getConnusername());
            dataSource.setPassword(repDataResource.getConnpassword());

            //DruidDatasource默认是无限自动重试，可能导致程序卡死。
            // 失败后重连的次数
            dataSource.setConnectionErrorRetryAttempts(2);
            // 请求失败之后中断
            dataSource.setBreakAfterAcquireFailure(true);

            DruidPooledConnection connection = dataSource.getConnection();
            connection.setConnectedTimeNano(30000000);
            System.out.println(connection);
            if(connection!=null){
                connection.close();
                return AjaxResult.success(true);
            }

            dataSource=null;
            return AjaxResult.success(false);
        }catch (Exception e){
            return AjaxResult.success(false);
        }
    }

    /**
     * 新增报表数据源管理
     */
    @PreAuthorize("@ss.hasPermi('report:resource:add')")
    @Log(title = "报表数据源管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RepDataResource repDataResource)
    {
        return toAjax(repDataResourceService.insertRepDataResource(repDataResource));
    }

    /**
     * 修改报表数据源管理
     */
    @PreAuthorize("@ss.hasPermi('report:resource:edit')")
    @Log(title = "报表数据源管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RepDataResource repDataResource)
    {
        return toAjax(repDataResourceService.updateRepDataResource(repDataResource));
    }

    /**
     * 删除报表数据源管理
     */
    @PreAuthorize("@ss.hasPermi('report:resource:remove')")
    @Log(title = "报表数据源管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(repDataResourceService.deleteRepDataResourceByIds(ids));
    }
}
