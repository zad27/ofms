package com.ruoyi.report.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 报数据源管理对象 report_data_resource
 * 
 * @author Pekin
 * @date 2021-10-25
 */
public class RepDataResource extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 序号 */
    private Long id;

    /** 连接名称 */
    @Excel(name = "连接名称")
    private String connname;

    /** 数据库类型 */
    @Excel(name = "数据库类型")
    private String conntype;

    /** 驱动包名 */
    @Excel(name = "驱动包名")
    private String conndriverclass;

    /** IP地址 */
    @Excel(name = "IP地址")
    private String connip;

    /** 端口号 */
    @Excel(name = "端口号")
    private String connport;

    /** 数据库名 */
    @Excel(name = "数据库名")
    private String conndbname;

    /** 用户名 */
    @Excel(name = "用户名")
    private String connusername;

    /** 密码 */
    @Excel(name = "密码")
    private String connpassword;

    /** 附加参数 */
    @Excel(name = "附加参数")
    private String connproperty;

    /** 创建日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdate;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setConnname(String connname) 
    {
        this.connname = connname;
    }

    public String getConnname() 
    {
        return connname;
    }
    public void setConntype(String conntype) 
    {
        this.conntype = conntype;
    }

    public String getConntype() 
    {
        return conntype;
    }
    public void setConndriverclass(String conndriverclass) 
    {
        this.conndriverclass = conndriverclass;
    }

    public String getConndriverclass() 
    {
        return conndriverclass;
    }
    public void setConnip(String connip) 
    {
        this.connip = connip;
    }

    public String getConnip() 
    {
        return connip;
    }
    public void setConnport(String connport) 
    {
        this.connport = connport;
    }

    public String getConnport() 
    {
        return connport;
    }
    public void setConndbname(String conndbname) 
    {
        this.conndbname = conndbname;
    }

    public String getConndbname() 
    {
        return conndbname;
    }
    public void setConnusername(String connusername) 
    {
        this.connusername = connusername;
    }

    public String getConnusername() 
    {
        return connusername;
    }
    public void setConnpassword(String connpassword) 
    {
        this.connpassword = connpassword;
    }

    public String getConnpassword() 
    {
        return connpassword;
    }
    public void setConnproperty(String connproperty) 
    {
        this.connproperty = connproperty;
    }

    public String getConnproperty() 
    {
        return connproperty;
    }
    public void setCreatedate(Date createdate) 
    {
        this.createdate = createdate;
    }

    public Date getCreatedate() 
    {
        return createdate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("connname", getConnname())
            .append("conntype", getConntype())
            .append("conndriverclass", getConndriverclass())
            .append("connip", getConnip())
            .append("connport", getConnport())
            .append("conndbname", getConndbname())
            .append("connusername", getConnusername())
            .append("connpassword", getConnpassword())
            .append("connproperty", getConnproperty())
            .append("createdate", getCreatedate())
            .toString();
    }
}
