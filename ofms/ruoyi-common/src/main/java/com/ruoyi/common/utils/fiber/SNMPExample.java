package com.ruoyi.common.utils.fiber;

import lombok.extern.slf4j.Slf4j;
import org.snmp4j.CommunityTarget;
import org.snmp4j.PDU;
import org.snmp4j.Snmp;
import org.snmp4j.TransportMapping;
import org.snmp4j.event.ResponseEvent;
import org.snmp4j.mp.SnmpConstants;
import org.snmp4j.smi.*;
import org.snmp4j.transport.DefaultUdpTransportMapping;

import java.io.IOException;

/**
 * @author ：WQ
 * @date ：Created in 2023/10/16 0016 16:29
 * @description：TODO
 */
@Slf4j
public class SNMPExample {
    public static void main(String[] args) {
        // SNMP设备信息
        String ipAddress = "192.168.1.50";
        String community = "OTU";
        int snmpVersion = SnmpConstants.version2c;

        // OID信息
        String oid = "1.3.6.1.4.1.35873.5.1.2.1.1.1.7";

        /*try {
            // 创建传输通信方式
            TransportMapping<?> transport = new DefaultUdpTransportMapping();
            transport.listen();

            // 创建SNMP实例
            Snmp snmp = new Snmp(transport);

            // 创建目标对象
            CommunityTarget target = new CommunityTarget();
            target.setCommunity(new OctetString(community));
            target.setAddress(GenericAddress.parse("udp:" + ipAddress + "/161"));
            target.setVersion(snmpVersion);

            // 创建PDU
            PDU pdu = new PDU();
            pdu.add(new VariableBinding(new OID(oid)));
            pdu.setType(PDU.GET);

            // 发送请求
            ResponseEvent event = snmp.send(pdu, target);
            PDU response = event.getResponse();

            if (response != null) {
                if (response.getErrorStatus() == PDU.noError) {
                    // 获取结果
                    Variable var = response.getVariable(new OID(oid));
                    System.out.println("OID value: " + var.toString());
                } else {
                    System.out.println("Error: " + response.getErrorStatusText());
                }
            } else {
                System.out.println("Error: Response PDU is null");
            }

            // 关闭SNMP连接
            snmp.close();
        } catch (Exception e) {
            e.printStackTrace();
        }*/
    }

    public static PDU response(String ipAddress,String community,String oid){
        Snmp snmp = null;
        PDU response = null;
        try {
            // 创建传输通信方式
            TransportMapping<?> transport = new DefaultUdpTransportMapping();
            transport.listen();

            // 创建SNMP实例
            snmp = new Snmp(transport);

            // 创建目标对象
            CommunityTarget target = new CommunityTarget();
            target.setCommunity(new OctetString(community));
            target.setAddress(GenericAddress.parse("udp:" + ipAddress + "/161"));

            int snmpVersion = SnmpConstants.version2c;
            target.setVersion(snmpVersion);

            // 创建PDU
            PDU pdu = new PDU();
            pdu.add(new VariableBinding(new OID(oid)));
            pdu.setType(PDU.GET);

            // 发送请求
            ResponseEvent event = snmp.send(pdu, target);
            response = event.getResponse();

            return response;
        } catch (Exception e) {
            log.error("============Error: 获取检测结果异常：" + e.getMessage());
            e.printStackTrace();
            return null;
        }finally {
            // 关闭SNMP连接
            try {
                if(null != snmp){
                snmp.close();
            }
            }catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }

    public static boolean isSuccess(PDU response){
        if (response != null) {
            if (response.getErrorStatus() == PDU.noError) {
                log.info("========获取探测结果成功");
               return true;
            } else {
                log.error("============Error: " + response.getErrorStatusText());
                System.out.println("Error: " + response.getErrorStatusText());
                return false;
            }
        } else {
            log.error("=============Error: Response PDU is null");
            System.out.println("Error: Response PDU is null");
            return false;
        }
    }

    public static String  parseResponse(PDU response,String oid){
        // 获取结果
        Variable var = response.getVariable(new OID(oid));
        log.info("========获取探测结果成功：OID value(RS): " + var.toString());
        System.out.println("========OID value(RS): " + var.toString());
        String rs = var.toString();
        return rs;
    }
}
