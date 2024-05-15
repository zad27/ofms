package com.ruoyi.framework.datasource;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class DataSource {
    String id;
    String connIp;
    String connPort;
    String connDbName;
    String connUserName;
    String connPassWord;
    String connName;
    String connType;
    String connProperty;
    String connDriverClass;
}
