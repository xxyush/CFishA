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

//�������ݿ�ʹ�õ�
import java.sql.*;
public class resourceConnectStuct extends HttpServlet
{
	private static final long serialVersionUID = -6294793449905043520L;
	/*��ͼ������������*/
	public int netCount=6;//��������������ʱ����Ϊ6�������ݿ��ȡ
	public int boneNetLocX[];//��ŹǸ�����λ����Ϣ��������ͼ����netId��Ϊ����
	public int boneNetLocY[];
	public int boneNetR=50;//�Ǹ�����뾶��С���������
	public int boneNetLongR=80;//�����⾶
	public int componentwidth=15;
	public int componentheight=10;
	public int netIdArray[];
	public int netIdCountArray[];
	//����Servlet�Ĺ��췽������ʼ�����������ٷ���
     public resourceConnectStuct(){
       super();
       }
 
     public void init() throws ServletException{
    	 
        super.init();
       }
 
     public void destroy(){
        super.destroy();
       }    
   
   //�������磨Բ�������Ϣ��
     public void drawBoneNet(int Id,Graphics2D g)//��ͬ����ͼ��λ��
     {  	 
    	 //���ƹǸ�����
    	 g.setColor(Color.blue);//������ɫ������netID������ɫ�����޸�
    	 BasicStroke s=new BasicStroke(2f); //���û��ʴ�ϸ
    	 g.setStroke(s);
    	 g.drawOval(boneNetLocX[Id], boneNetLocY[Id], 2*boneNetR, 2*boneNetR);//��Բ
    	 g.drawString("����:"+String.valueOf(netIdArray[Id]),boneNetLocX[Id]+13, boneNetLocY[Id]+boneNetR+5);//���������Ϣ 	 
     }
     
 /*
  * �������/countΪ�������ѽ������������innerIdΪĳ�����ڸ������ڲ���ţ������ͼ
  */
     public void drawConponent(int Id,int cabinetNo,int componentId,int rj45Id,String ipAddr,int count,int innerId,Graphics2D g)
     { 	 
    	 double sinx=Math.sin(2*innerId*Math.PI/count);
    	 double cosx=Math.cos(2*innerId*Math.PI/count);
    	 int x1=(int)(boneNetLocX[Id]+boneNetR*(1+cosx));
    	 int y1=(int)(boneNetLocY[Id]+boneNetR*(1-sinx));
    	 int x2=(int)(boneNetLocX[Id]+boneNetR+boneNetLongR*cosx);
    	 int y2=(int)(boneNetLocY[Id]+boneNetR-boneNetLongR*sinx); 	 
    	 g.setColor(Color.darkGray);//������ɫ������netID������ɫ�����޸�
    	 BasicStroke s=new BasicStroke(1f); //���û��ʴ�ϸ
    	 g.setStroke(s);
    	 g.drawLine(x1, y1, x2, y2);//��������  	 
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
    	 g.setFont(new Font("����", Font.PLAIN, 10));
    	 g.drawString("��"+String.valueOf(cabinetNo),x+5, y+12);
    	 g.drawString("���"+String.valueOf(componentId),x+27, y+12);
    	 g.drawString(" IP:"+ipAddr,x-15, y+26);
    	 //���������־	 
     }
     public void getDataAndDraw(Graphics2D g)
     {
    	 resourceConnectStuct.this.boneNetR=30;
   	     resourceConnectStuct.this.boneNetLongR=80;
   	     resourceConnectStuct.this.componentwidth=25;
   	     resourceConnectStuct.this.componentheight=15;
    	 String driver ="com.mysql.jdbc.Driver";
    	// URLָ��Ҫ���ʵ����ݿ���
    	String url = "jdbc:mysql://127.0.0.1:3306/CFA_DATABASE";
    	// MySQL����ʱ���û���
    	String user = "root";
    	// Java����MySQL����ʱ������
    	String password ="";
    	try 
    	{
    	// ������������
         	Class.forName(driver);
    	// �������ݿ�
    	    Connection conn = DriverManager.getConnection(url, user, password);
    	    if(!conn.isClosed())
    	       System.out.println("Succeeded connecting to the Database!");
    	// statement����ִ��SQL���
  	        Statement statement = conn.createStatement();
  	        String sql1="SELECT *  FROM TB_Ethernet_Struc_Info order by netNo";
       //   String sql2="SELECT DISTINCT netNo FROM tb_ethernet_struc_info";
    	    String sql3="SELECT netNo,count(netNo)  FROM TB_Ethernet_Struc_Info group by netNo";
    	    
    	    ResultSet rs3 = statement.executeQuery(sql3);
    	    int i=1;
    	    rs3.last();  
    	    netCount = rs3.getRow();//�õ�������
    	    rs3.beforeFirst();
    	    
            System.out.println("netCount="+netCount);
    	    
    	    boneNetLocX=new int[netCount+1];
      	    boneNetLocY=new int[netCount+1];
      	    netIdArray=new int[netCount+1];
      	    netIdCountArray=new int[netCount+1];
    	    while(rs3.next())
    	    {
    	     	System.out.println("����"+rs3.getInt(1)+"��"+rs3.getInt(2)+"����");
    	     	netIdArray[i]=rs3.getInt(1);
    	    	netIdCountArray[i]=rs3.getInt(2);    	
    	    	i++;
    	    }
    	      
    	    for(i=1;i<=netCount;i++)//���ڻ�ͼ��λ����Ϣ
      	     {
    	    	int tempy=i%3;
    	    	int tempx=0;
    	    	if(tempy==0)
    	    		tempy=3;
    	    	tempx=(i-tempy)/3+1;
       		    boneNetLocX[i]=tempy*275-180;
       		    boneNetLocY[i]=tempx*200-120;
       		    System.out.println(i+"λ����Ϣx="+boneNetLocX[i]+"y="+boneNetLocY[i]);
       	     } 
    	  
    	    for(i=1;i<=netCount;i++)
                drawBoneNet(i,g);//���ƹǸ�����
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
 //����һ��ͼƬ
     public void resourceConnectStuctImage(ServletOutputStream out)
   {
     
    	 /*������С*/
        int width=920;
        int height=netCount*65+100;
        Color backColor=new Color(0xCAE1FF);
        BufferedImage bi=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        Graphics2D g=bi.createGraphics(); 
        g.setBackground(backColor);//���ñ�����ɫ
        g.clearRect(0, 0, width, height);
     
        /*���Դ���*/
       
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
//����ͻ������󲢵���createImage()������ͻ��������һ��ͼƬ
     public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        response.setContentType("image/jpeg");
        resourceConnectStuctImage(response.getOutputStream());
      }
}