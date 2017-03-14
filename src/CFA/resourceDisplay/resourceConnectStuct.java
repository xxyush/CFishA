package CFA.resourceDisplay;
import java.io.IOException;
import java.awt.*;
import java.awt.image.*;
import javax.servlet.*;
import com.sun.image.codec.jpeg.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//连接数据库使用的
import java.sql.*;
public class resourceConnectStuct extends HttpServlet
{
	private static final long serialVersionUID = -6294793449905043520L;
	/*绘图基本参数设置*/
	public int netCount=6;//网络数量，调试时假设为6，由数据库读取
	public int boneNetLocX[];//存放骨干网络位置信息，方便作图，用netId作为索引
	public int boneNetLocY[];
	public int boneNetR=50;//骨干网络半径大小，方便调整
	public int boneNetLongR=80;//网络外径
	public int componentwidth=15;
	public int componentheight=10;
	public int netIdArray[];
	public int netIdCountArray[];
	//创建Servlet的构造方法、初始化方法和销毁方法
     public resourceConnectStuct(){
       super();
       }
 
     public void init() throws ServletException{
    	 
        super.init();
       }
 
     public void destroy(){
        super.destroy();
       }    
   
   //绘制网络（圆，标记信息）
     public void drawBoneNet(int Id,Graphics2D g)//共同决定图中位置
     {  	 
    	 //绘制骨干网络
    	 g.setColor(Color.blue);//设置颜色，根据netID调整颜色，待修改
    	 BasicStroke s=new BasicStroke(2f); //设置画笔粗细
    	 g.setStroke(s);
    	 g.drawOval(boneNetLocX[Id], boneNetLocY[Id], 2*boneNetR, 2*boneNetR);//画圆
    	 g.drawString("网络:"+String.valueOf(netIdArray[Id]),boneNetLocX[Id]+13, boneNetLocY[Id]+boneNetR+5);//网络基本信息 	 
     }
     
 /*
  * 绘制组件/count为该网络已接入的网口数，innerId为某网口在该网络内部编号，方便绘图
  */
     public void drawConponent(int Id,int cabinetNo,int componentId,int rj45Id,String ipAddr,int count,int innerId,Graphics2D g)
     { 	 
    	 double sinx=Math.sin(2*innerId*Math.PI/count);
    	 double cosx=Math.cos(2*innerId*Math.PI/count);
    	 int x1=(int)(boneNetLocX[Id]+boneNetR*(1+cosx));
    	 int y1=(int)(boneNetLocY[Id]+boneNetR*(1-sinx));
    	 int x2=(int)(boneNetLocX[Id]+boneNetR+boneNetLongR*cosx);
    	 int y2=(int)(boneNetLocY[Id]+boneNetR-boneNetLongR*sinx); 	 
    	 g.setColor(Color.darkGray);//设置颜色，根据netID调整颜色，待修改
    	 BasicStroke s=new BasicStroke(1f); //设置画笔粗细
    	 g.setStroke(s);
    	 g.drawLine(x1, y1, x2, y2);//画连接线  	 
    	 int x=x2;
    	 int y=y2; 
    	 if(sinx==1&&cosx==0)
    	 {
    		 x=x2-componentwidth/2;	
			 y=y2-componentheight;
    	 }
    	 else if (sinx==0&&cosx==-1)
    	 {
    		 x=x2-componentwidth;	
			 y=y2-componentheight/2;
    	 }
    	 else if (sinx==-1&&cosx==0)
    	 {
    		 x=x2-componentwidth/2;	
			 y=y2;
    	 }
    	 else if (sinx==0&&cosx==1)
    	 {
    		 x=x2;	
			 y=y2-componentheight/2;
    	 }
    	 else if (sinx>0&&cosx>0)
    	 {
    		 x=x2;	
			 y=y2-componentheight/2;
    	 }
    	 else if (sinx>0&&cosx<0)
    	 {
    		 x=x2-componentwidth;	
			 y=y2-componentheight/2;
    	 }
    	 else if (sinx<0&&cosx<0)
    	 {
    		 x=x2-componentwidth;	
			 y=y2-componentheight/2;
    	 }
    	 else if (sinx<1&&cosx>0)
    	 {
    		 x=x2;	
			 y=y2-componentheight/2;
    	 }	 
    	 g.drawRect(x, y, componentwidth,componentheight);
    	 g.setFont(new Font("宋体", Font.PLAIN, 10));
    	 g.drawString("柜"+String.valueOf(cabinetNo),x+5, y+12);
    	 g.drawString("组件"+String.valueOf(componentId),x+27, y+12);
    	 g.drawString(" IP:"+ipAddr,x-15, y+26);
    	 //绘制组件标志	 
     }
     public void getDataAndDraw(Graphics2D g)
     {
    	 resourceConnectStuct.this.boneNetR=30;
   	     resourceConnectStuct.this.boneNetLongR=80;
   	     resourceConnectStuct.this.componentwidth=25;
   	     resourceConnectStuct.this.componentheight=15;
    	 String driver ="com.mysql.jdbc.Driver";
    	// URL指向要访问的数据库名
    	String url = "jdbc:mysql://127.0.0.1:3306/CFA_DATABASE";
    	// MySQL配置时的用户名
    	String user = "root";
    	// Java连接MySQL配置时的密码
    	String password ="";
    	try 
    	{
    	// 加载驱动程序
         	Class.forName(driver);
    	// 连接数据库
    	    Connection conn = DriverManager.getConnection(url, user, password);
    	    if(!conn.isClosed())
    	       System.out.println("Succeeded connecting to the Database!");
    	// statement用来执行SQL语句
  	        Statement statement = conn.createStatement();
  	        String sql1="SELECT *  FROM TB_Ethernet_Struc_Info order by netNo";
       //   String sql2="SELECT DISTINCT netNo FROM tb_ethernet_struc_info";
    	    String sql3="SELECT netNo,count(netNo)  FROM TB_Ethernet_Struc_Info group by netNo";
    	    
    	    ResultSet rs3 = statement.executeQuery(sql3);
    	    int i=1;
    	    rs3.last();  
    	    netCount = rs3.getRow();//得到网络数
    	    rs3.beforeFirst();
    	    
            System.out.println("netCount="+netCount);
    	    
    	    boneNetLocX=new int[netCount+1];
      	    boneNetLocY=new int[netCount+1];
      	    netIdArray=new int[netCount+1];
      	    netIdCountArray=new int[netCount+1];
    	    while(rs3.next())
    	    {
    	     	System.out.println("网络"+rs3.getInt(1)+"有"+rs3.getInt(2)+"个！");
    	     	netIdArray[i]=rs3.getInt(1);
    	    	netIdCountArray[i]=rs3.getInt(2);    	
    	    	i++;
    	    }
    	      
    	    for(i=1;i<=netCount;i++)//用于绘图的位置信息
      	     {
    	    	int tempy=i%3;
    	    	int tempx=0;
    	    	if(tempy==0)
    	    		tempy=3;
    	    	tempx=(i-tempy)/3+1;
       		    boneNetLocX[i]=tempy*275-180;
       		    boneNetLocY[i]=tempx*200-120;
       		    System.out.println(i+"位置信息x="+boneNetLocX[i]+"y="+boneNetLocY[i]);
       	     } 
    	  
    	    for(i=1;i<=netCount;i++)
                drawBoneNet(i,g);//绘制骨干网络
    	     rs3.close();
    	  
    	    ResultSet rs1 = statement.executeQuery(sql1);
    	    int innerId=0;
    	    int tempNetId=-1;
    	    i=0;
    	    while(rs1.next()) 
  	        {
    	    	if(tempNetId==rs1.getInt("netNo"))
    	        	innerId++;
    	    	else
    	    	{
    	    		innerId=1;
    	    		tempNetId=rs1.getInt("netNo");
    	    		i++;
    	    	}
    	    	drawConponent(i,rs1.getInt("cabinetNo"),rs1.getInt("componentId"),rs1.getInt("rj45Id"),rs1.getString("ipAddr"),netIdCountArray[i],innerId,g);
  	        }
    	    rs1.close();
    	    conn.close();   
    	  }
    	catch(ClassNotFoundException e) 
    	{   
    	    System.out.println("Sorry,can`t find the Driver!");   
    	     e.printStackTrace();   
    	}
    	catch(SQLException e)
    	{   
    	     e.printStackTrace();   
    	}
    	catch(Exception e) 
    	{   
    	    e.printStackTrace();   
    	}   
    	
     }     
 //绘制一个图片
     public void resourceConnectStuctImage(ServletOutputStream out)
   {
     
    	 /*画布大小*/
        int width=920;
        int height=netCount*65+100;
        Color backColor=new Color(0xCAE1FF);
        BufferedImage bi=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        Graphics2D g=bi.createGraphics(); 
        g.setBackground(backColor);//设置背景颜色
        g.clearRect(0, 0, width, height);
     
        /*测试代码*/
       
        getDataAndDraw(g);
            
        g.dispose();
        bi.flush();
        JPEGImageEncoder encoder=JPEGCodec.createJPEGEncoder(out);
        JPEGEncodeParam param=encoder.getDefaultJPEGEncodeParam(bi);
        param.setQuality(1.0f, false);
        encoder.setJPEGEncodeParam(param);
        try
       {
           encoder.encode(bi);
       }catch(IOException ioe)
       {
          ioe.printStackTrace();
       }
  
      }
//处理客户端请求并调用createImage()方法向客户端输出了一个图片
     public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        response.setContentType("image/jpeg");
        resourceConnectStuctImage(response.getOutputStream());
      }
}