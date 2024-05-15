package com.ruoyi.common.utils.fiber;

import lombok.extern.slf4j.Slf4j;

import java.io.*;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

/**
 * @author ：WQ
 * @date ：Created in 2023/11/15 0015 16:24
 * @description：TODO
 */
@Slf4j
public class OTDR8000Utils {
    String ipAddress = "192.168.20.74";
    int port = 8002;
    String command = "*REM;*IDN?";

    public String getExecuteCommand(String command) {
        String result = null;

        try {
            // 创建Socket连接
            Socket socket = new Socket(ipAddress, port);

            // 获取输入流和输出流
            InputStream input = socket.getInputStream();
            OutputStream output = socket.getOutputStream();

            // 发送命令
            output.write((command + "\r\n").getBytes());
            output.flush();

            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();

            // 关闭连接
            socket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return result;
    }


    public void initONA800() {
        try {
            // 创建Socket连接
            Socket socket = new Socket(ipAddress, port);

            // 获取输入流和输出流
            InputStream input = socket.getInputStream();
            OutputStream output = socket.getOutputStream();

            // 发送命令
            output.write((command + "\r\n").getBytes());
            output.flush();

            setSWMode("SINgle",output);

            /*setSWMode("CONtinuous",output);
            setSWInterval("60",output);*/
            setMTIme("1",output);
            setRANge("500",output);
            setSRES("0.5",output);

            setDUNits("METre",output);
            setTUNits("CELsius",output);
            setTMODe("STD",output);
            setDMIN("0",output);
            setDMAX("250",output);
            setDINC("2",output);

            setMODe("1,ACTive",output);
            setTMM("1,15,30",output);
            setDIPositive("1,0",output);
            setDINegative("1,0",output);

            // 关闭连接
            socket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }



    }

    public void setSWMode(String param,OutputStream output) {
        try {
            output.write(("DTS:ACQ:SWMode "+param+"\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public String getSWMode(InputStream input,OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:ACQ:SWMode?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setSWInterval(String param, OutputStream output) {
        try {
            output.write(("DTS:ACQ:SWInterval " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getSWInterval(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:ACQ:SWInterval?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setMTIme(String param, OutputStream output) {
        try {
            output.write(("DTS:ACQ:MTIme " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getMTIme(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:ACQ:MTIme?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setRANge(String param, OutputStream output) {
        try {
            output.write(("DTS:ACQ:RANge " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getRANge(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:ACQ:RANge?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setSRES(String param, OutputStream output) {
        try {
            output.write(("DTS:ACQ:SRES " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getSRES(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:ACQ:SRES?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setDUNits(String param, OutputStream output) {
        try {
            output.write(("DTS:DIS:DUNits " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getDUNits(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:DIS:DUNits?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setTUNits(String param, OutputStream output) {
        try {
            output.write(("DTS:DIS:TUNits " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getTUNits(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:DIS:TUNits?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setTMODe(String param, OutputStream output) {
        try {
            output.write(("DTS:DIS:TMODe " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getTMODe(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:DIS:TMODe?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setREFerences(String param, OutputStream output) {
        try {
            output.write(("DTS:DIS:REFerences " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getREFerences(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:DIS:REFerences?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setDMIN(String param, OutputStream output) {
        try {
            output.write(("DTS:DIS:DMIN " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getDMIN(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:DIS:DMIN?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setDMAX(String param, OutputStream output) {
        try {
            output.write(("DTS:DIS:DMAX " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getDMAX(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:DIS:DMAX?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setDINC(String param, OutputStream output) {
        try {
            output.write(("DTS:DIS:DINC " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getDINC(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:DIS:DINC?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setVIEW(String param, OutputStream output) {
        try {
            output.write(("DTS:DIS:VIEW " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getVIEW(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:DIS:VIEW?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setZNB(String param, OutputStream output) {
        try {
            output.write(("DTS:DIS:ZNB " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getZNB(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:DIS:ZNB?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setZINDex(String param, OutputStream output) {
        try {
            output.write(("DTS:DIS:ZINDex " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getZINDex(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:DIS:ZINDex?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setZSTArt(String param, OutputStream output) {
        try {
            output.write(("DTS:DIS:ZSTArt " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getZSTArt(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:DIS:ZSTArt?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setZSPAn(String param, OutputStream output) {
        try {
            output.write(("DTS:DIS:ZSPAn " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getZSPAn(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:DIS:ZSPAn?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setZID(String param, OutputStream output) {
        try {
            output.write(("DTS:DIS:ZID " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getZID(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:DIS:ZID?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setMODe(String param, OutputStream output) {
        try {
            output.write(("DTS:ALA:MODe " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getMODe(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:ALA:MODe?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setTMM(String param, OutputStream output) {
        try {
            output.write(("DTS:ALA:TMM " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getTMM(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:ALA:TMM?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setDIPositive(String param, OutputStream output) {
        try {
            output.write(("DTS:ALA:DIPositive " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getDIPositive(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:ALA:DIPositive?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setDINegative(String param, OutputStream output) {
        try {
            output.write(("DTS:ALA:DINegative " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getDINegative(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:ALA:DINegative?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setRefMODe(String param, OutputStream output) {
        try {
            output.write(("DTS:REF:MODe " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getRefMODe(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:REF:MODe?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setRefSTATus(String param, OutputStream output) {
        try {
            output.write(("DTS:REF:STATus " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getRefSTATus(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:REF:STATus?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setRefINDex(String param, OutputStream output) {
        try {
            output.write(("DTS:REF:INDex " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getRefINDex(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:REF:INDex?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setRefSTARt(String param, OutputStream output) {
        try {
            output.write(("DTS:REF:STARt " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getRefSTARt(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:REF:STARt?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setRefSPAn(String param, OutputStream output) {
        try {
            output.write(("DTS:REF:SPAn " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getRefSPAn(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:REF:SPAn?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setRefTEMPerature(String param, OutputStream output) {
        try {
            output.write(("DTS:REF:TEMPerature " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getRefTEMPerature(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:REF:TEMPerature?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setResMTIme(String param, OutputStream output) {
        try {
            output.write(("DTS:RES:MTIme " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getResMTIme(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:RES:MTIme?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setResDATe(String param, OutputStream output) {
        try {
            output.write(("DTS:RES:DATe " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getResDATe(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:RES:DATe?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setResTIMe(String param, OutputStream output) {
        try {
            output.write(("DTS:RES:TIMe " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getResTIMe(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:RES:TIMe?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setResRESolution(String param, OutputStream output) {
        try {
            output.write(("DTS:RES:RESolution " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getResRESolution(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:RES:RESolution?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setResMODe(String param, OutputStream output) {
        try {
            output.write(("DTS:RES:MODe " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getResMODe(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:RES:MODe?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setResREFerence(String param, OutputStream output) {
        try {
            output.write(("DTS:RES:REFerence " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getResREFerence(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:RES:REFerence?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setResGAIN(String param, OutputStream output) {
        try {
            output.write(("DTS:RES:GAIN " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getResGAIN(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:RES:GAIN?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setResOFFSet(String param, OutputStream output) {
        try {
            output.write(("DTS:RES:OFFSet " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getResOFFSet(InputStream input, OutputStream output) {
        String result = null;
        try {
            output.write(("DTS:RES:OFFSet?\r\n").getBytes());
            output.flush();
            // 读取命令执行结果
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            result = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void setDisGRAPh(String param, OutputStream output) {
        try {
            output.write(("DTSS:DIS:GRAPh " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void setCURSELect(String param, OutputStream output) {
        try {
            output.write(("CURve:SELect " + param + "\r\n").getBytes());
            output.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<Double[]> getTemperatureData(InputStream input, OutputStream output) {
        try {
            output.write("CURve:XSCale?\r\n".getBytes());
            double xa = Double.valueOf((new BufferedReader(new InputStreamReader(input))).readLine());

            output.write("CURve:XOFfset?\r\n".getBytes());
            double xb = Double.valueOf((new BufferedReader(new InputStreamReader(input))).readLine());

            output.write("CURve:YOFfset?\r\n".getBytes());
            double yb = Double.valueOf((new BufferedReader(new InputStreamReader(input))).readLine());

            output.write("CURve:YSCale?\r\n".getBytes());
            double ya = Double.valueOf((new BufferedReader(new InputStreamReader(input))).readLine());

            output.write(("CURve:BUFFer?\r\n").getBytes());
            String hex = (new BufferedReader(new InputStreamReader(input))).readLine().substring(9);

            List<Double[]> testdata = new ArrayList<>();

            for(int i = 0; i < hex.length(); i += 4) {
                String temp = hex.substring(i, i + 4);
                short value = Integer.decode("0x" + temp).shortValue();
                double y = ya * (double)value + yb;
                double x = xa * (double)(i / 4) + xb;
                testdata.add(new Double[]{BigDecimal.valueOf(x).setScale(5, RoundingMode.HALF_UP).doubleValue(), BigDecimal.valueOf(y).setScale(5, RoundingMode.HALF_UP).doubleValue()});
            }

            return testdata;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }


    public static void main(String[] args) {
        String ipAddress = "192.168.20.74";
        int port = 8002;
        String command = "*REM;*IDN?";
        Socket socket = null;

        fiberRemLog(ipAddress,port,command);

        /*try {
            socket = new Socket(ipAddress, port);
            // 获取连接的输入和输出流
            InputStream input = socket.getInputStream();
            OutputStream output = socket.getOutputStream();

            // 读取设备的输出
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));

            // 发送命令
            output.write((command + "\r\n").getBytes());
            output.flush();

            // 读取命令执行结果
            String  line = reader.readLine();
            System.out.println(line); // 打印命令执行结果

            OTDR8000Utils otdrUtils = new OTDR8000Utils();
            List<Double[]> temperatureData = otdrUtils.getTemperatureData(input, output);
            for (Double[] temperatureDatum : temperatureData) {
                System.out.println("横坐标："+temperatureDatum[0]+" 纵坐标："+temperatureDatum[1]);

            }
         *//*   String SWMode = otdrUtils.getSWMode(input, output);
            System.out.println("扫描模式"+SWMode);

            String swInterval = otdrUtils.getSWInterval(input, output);
            System.out.println("扫描间隔"+swInterval);

            otdrUtils.setSWInterval("60",output);

            String swInterval1 = otdrUtils.getSWInterval(input, output);
            System.out.println("扫描间隔"+swInterval1);

            String swMTIme = otdrUtils.getMTIme(input, output);
            System.out.println("测量时间"+swMTIme);*//*


            // 关闭连接
            socket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }*/


    }

    // 光纤测试设备登录
    public static String fiberRemLog(String ipAddress,int port,String command){
        Socket socket = null;
        try {
            socket = new Socket(ipAddress, port);
            // 获取连接的输入和输出流
            InputStream input = socket.getInputStream();
            OutputStream output = socket.getOutputStream();

            // 读取设备的输出
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));

            // 发送命令
            output.write((command + "\r\n").getBytes());
            output.flush();

            // 读取命令执行结果
            String  line = reader.readLine();
            System.out.println(line); // 打印命令执行结果

            OTDR8000Utils otdrUtils = new OTDR8000Utils();
            List<Double[]> temperatureData = otdrUtils.getTemperatureData(input, output);
            for (Double[] temperatureDatum : temperatureData) {
                System.out.println("横坐标："+temperatureDatum[0]+" 纵坐标："+temperatureDatum[1]);

            }

            // 关闭连接
            socket.close();
            return line;
        } catch (IOException e) {
            log.error("============设备登录失败");
            e.printStackTrace();
        }
        return null;
    }
}
