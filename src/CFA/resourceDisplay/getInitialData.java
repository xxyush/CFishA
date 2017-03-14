package CFA.resourceDisplay;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.wsdl.util.StringUtils;
import com.snda.toolkit.common.util.StringUtil;

import CFA.resourceDisplay.databaseOperation;
import CFA.resourceDisplay.numIdConverter;

import java.sql.*;
import java.util.*;
import java.io.PrintWriter;
/**
 * Servlet implementation class getCpuUsed
 */
@WebServlet("/getInitialData")
public class getInitialData extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private databaseOperation dbc;

	
    /**
     * Default constructor. 
     */
    public getInitialData() {
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		dbc=new databaseOperation();
		dbc.connectDatabase();
        }
        
    public String getTempStateColor(double maxValue,double minValue,double realValue)//得到温度的各种状态的颜色
             {
                if(((4.0/5)*maxValue)<=realValue)//当温度数超过最高的的4/5时，表示存在故障，显示红色
                 return "red"; 
               else if (realValue>minValue&&realValue<((1.0/5)*maxValue))//当温度是在最高温度和最高温度的1/5时，表示之间状态，显示黄色。
                  return "yellow";
               else
            	    if(realValue>=((1.0/5)*maxValue)&&realValue<=((4.0/5)*maxValue))//当温度是在最高温度的1/5和最高温度的4/5之间时，表示正常状态，显示绿色。
            	    return "green";
            	    else
            	    return "gray";
                 
             }
    public String getPowerStateColor(double maxValue,double minValue,double realValue)//得到功率的各种状态的颜色
    {
       if(((4.0/5)*maxValue)<=realValue)//当功率超过最高的的4/5时，表示存在故障，显示红色
        return "red"; 
      else if (realValue>minValue&&realValue<((1.0/5)*maxValue))//当功率是在最小功率和额定功率的1/5时，表示之间状态，显示黄色。
         return "yellow";
      else
   	    if(realValue>=((1.0/5)*maxValue)&&realValue<=((4.0/5)*maxValue))//当功率是在额定功率的1/5和额定功率的4/5之间时，表示正常状态，显示绿色。
   	    return "green";
   	    else
   	    return "gray";
        
    }
       public  String getComponentState(char componentState)//得到机器电源状态
        { 
           if(componentState=='0')//状态位为0,表示故障关断，返回红色
              return "red";
           else 
              if(componentState=='1')//状态位为1,表示开启正常，返回绿色
                return "green";
             else 
                return "gray";
            }
       
       public String getInternetState(char rj45State){//得到网络的状态，即会生成菱形的颜色.
    	   if(rj45State=='0'){
    	       return "red";
    	   }
    	   else if(rj45State=='1'){
    		    return "green";
    	   }
    	    else{
    	    	return "gray";
    	    }
       }
       
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		        Long componentNo,cabinetNo;
		        Long star_componentNo,star_cabinetNo;//记录网络情况的器件号和机柜号
                Long componentId;
                Long star_componentId;//记录网络情况信息的id
                double maxPower,maxTemperature,componentPower,componentTemp;
		        String passParameter="";
	            char[] componentState;
	            String validTimeStr=request.getParameter("validTime");//接收从页面传递来的有效时间默认，此时为string类型
                long validTime=1;//有效时间，默认为三分钟
                String circleColor;
                String squareColor;
                String triangle_upColor;
                String diamondColor;
                
                String starMessage;
                char[] rj45State;
                if(!StringUtil.isEmpty(validTimeStr))//!"".equals(validTimeStr)&&validTimeStr!=null&&
                	{
                	 validTime=Long.parseLong(validTimeStr);//若传递来的时间不为空，则赋值改变默认时间
                	}
		     dbc.query("select  tci.componentId as componentId,tci.maxPower as maxPower,tci.maxTemperature as maxTemperature,tcrs.componentPower as componentPower,tcrs.componentTemp as componentTemp,tcrs.componentState as componentState,tcrs.dateStamp,tcrs.timeStamp from TB_Component_Info  tci,TB_Component_Run_State tcrs where tci.componentId=tcrs.componentId and timestampdiff(second,concat(dateStamp,\" \",timeStamp),now())<="+validTime);
		    
 	        try
		{
		   	
                //  dbc.rs.first();
                  while(dbc.rs.next())
                   {
                       
                       componentId=Long.parseLong(dbc.rs.getString("componentId"));
                        cabinetNo=componentId/4194304;//2的22次方是4194304
                       componentNo=(componentId%4194304)/131072;//2的17次方是131072
                       
                       maxPower=Double.parseDouble(dbc.rs.getString("maxPower"));
                       maxTemperature=Double.parseDouble(dbc.rs.getString("maxTemperature")); 
                       componentPower=Double.parseDouble(dbc.rs.getString("componentPower"));
                       componentTemp=Double.parseDouble(dbc.rs.getString("componentTemp"));
                       componentState=dbc.rs.getString("componentState").toCharArray();
                       
                       circleColor=getComponentState(componentState[0]);
                       squareColor=getPowerStateColor(maxPower,0,componentPower);
                       triangle_upColor=getTempStateColor(maxTemperature,0,componentTemp);
                      // star_fiveColor="gray";
                       diamondColor="gray";
                       passParameter=""+cabinetNo+","+componentNo+","+circleColor+","+squareColor+","+triangle_upColor+","+diamondColor+";";
                       out.write(passParameter);
                   }

                 
                      
		}
 	        catch(Exception e)
		{
			e.printStackTrace();
		}
 	       
 	       out.write("|");//用这个分割网络信息和前面三项指标的信息
 	  dbc.query("select rji.componentId as componentId,rjcs.rj45State as rj45State from tb_rj45_comm_state rjcs,tb_rj45_info rji where rji.rj45Id=rjcs.rj45Id and timestampdiff(second,concat(dateStamp,\" \",timeStamp),now())<="+validTime);
	  
 	   try
 			{
 			   	
 	                //  dbc.rs.first();
 	                  while(dbc.rs.next())
 	                   {
 	                       
 	                       star_componentId=Long.parseLong(dbc.rs.getString("componentId"));
 	                       star_cabinetNo=star_componentId/4194304;//2的22次方是4194304
 	                       star_componentNo=(star_componentId%4194304)/131072;//2的17次方是131072
 	                       rj45State=dbc.rs.getString("rj45State").toCharArray();
 	                       diamondColor=getInternetState(rj45State[0]);
 	                       starMessage=""+star_cabinetNo+","+star_componentNo+","+diamondColor+";";
 	                       out.write(starMessage);
 	                   }

 	                 
 	                      
 			}
 			catch(Exception e)
 			{
 				e.printStackTrace();
 			}
		//out.write(String.valueOf(r.nextInt(101)));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
