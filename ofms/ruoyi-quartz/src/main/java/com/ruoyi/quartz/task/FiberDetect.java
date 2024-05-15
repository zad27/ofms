package com.ruoyi.quartz.task;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.fiber.OTDR8000Utils;
import com.ruoyi.common.utils.fiber.SNMPExample;
import lombok.extern.slf4j.Slf4j;
import org.snmp4j.PDU;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * 光纤探测定时任务调度
 * 
 * @author zad
 */
@Component("fiberDetect")
@Slf4j
public class FiberDetect
{
    @Value("${fiber.ipAddress}")
    private String ipAddress;

    @Value("${fiber.port}")
    private int port;

    @Value("${fiber.command}")
    private String command;



    @Value("${fiber.community}")
    private String community;

    @Value("${fiber.oid}")
    private String oid;

    @Value("${fiber.errorTime:3}")
    private int errorTime;

    // 检测开始
    public void detect(String param)
    {
        log.info("========-----------------------------------光纤探测开始====={},{},{}",ipAddress,port,command);
        String loginRs = OTDR8000Utils.fiberRemLog(ipAddress,port,command);
        log.info("==================登录设备返回结果：" + loginRs);

        // 请参数设置


        // 获取测试结果
        String rs = getRs();
        // 解析返回结果并入库

    }

    // 获取检测结果
    public String getRs(){

        for(int i = 0; i < errorTime; i++){
            PDU response = SNMPExample.response(ipAddress,community,oid);
            if(SNMPExample.isSuccess(response)){
                String rs = SNMPExample.parseResponse(response,oid);
                return rs;
            }else{
                log.error("============第{}次获取检测结果失败，请查看具体日志",(i + 1));
            }
        }

        return null;
    }

}
