package CFA.resourceDisplay;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import CFA.resourceDisplay.databaseOperation;
import CFA.resourceDisplay.numIdConverter;

import java.sql.*;
import java.util.*;
import java.io.PrintWriter;
/**
 * Servlet implementation class getCpuUsed
 */
@WebServlet("/getCpuUsed")
public class getCpuUsed extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private databaseOperation dbc;
	private numIdConverter nic;
	Random r=new Random();
    /**
     * Default constructor. 
     */
    public getCpuUsed() {
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		dbc=new databaseOperation();
		dbc.connectDatabase();
		nic=new numIdConverter();
	}
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		
		long CPUID=nic.getUnitId(Integer.parseInt(request.getParameter("cabinetID")), Integer.parseInt(request.getParameter("componentID")), Integer.parseInt(request.getParameter("CPUID")));
		
		dbc.query("select cpuUsed from TB_Cpu_Used_State where cpuId="+CPUID+" and datediff(curdate(),dateStamp)=0 and timediff(curtime(),timeStamp)=\'00:00:01\' limit 1");
			
		try
		{
			dbc.rs.first();
			if(dbc.rs.getString("cpuUsed")!=null)
			{
				out.write(dbc.rs.getString("cpuUsed"));
			}
			else
			{
				out.write("-1");
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
