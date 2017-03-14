package CFA.resourceDisplay;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class getDiskUsed
 */
@WebServlet("/getDiskUsed")
public class getDiskUsed extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private databaseOperation dbc;
	private numIdConverter nic;
	Random r = new Random();
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getDiskUsed() {
        super();
        // TODO Auto-generated constructor stub
        
    }

    
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		dbc = new databaseOperation();
		dbc.connectDatabase();
		nic = new numIdConverter();
	}


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		//long diskID = nic.getUnitId(Integer.parseInt(request.getParameter("cabinetID")), Integer.parseInt(request.getParameter("componentID")),
	    //Integer.parseInt(request.getParameter("diskID")));
		long diskID = Integer.parseInt(request.getParameter("diskID"));
		dbc.query("select diskUsed from TB_Disk_Used_State where diskId="+diskID);
		
		
		try
		{
			dbc.rs.first();
			if(dbc.rs.getString("diskUsed")!=null)
			{
				out.write(dbc.rs.getString("diskUsed"));
			}
			else
			{
				out.write("-1");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}   

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
