package CFA.resourceDisplay;

import com.mysql.jdbc.Driver;
import java.sql.*;

public class databaseOperation {
	private Connection conn;
    private Statement stat;
    public ResultSet rs;
    public ResultSetMetaData rsmd;
    
    public databaseOperation()
    {
    	
    }
    
    public boolean connectDatabase()
    {
    	try
    	{
    		Class.forName("com.mysql.jdbc.Driver").newInstance();
    		conn=DriverManager.getConnection("jdbc:mysql://localhost/cfa_database","tongji","tongji");
    		stat=conn.createStatement();
    		return true;
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		return false;
    	}
    }
    
    public boolean connectDatabase(String host,String databaseName,String userName,String password)
    {
    	try
    	{
    		Class.forName("com.mysql.jdbc.Driver").newInstance();
    		conn=DriverManager.getConnection("jdbc:mysql://"+host+"/"+databaseName,userName,password);
    		stat=conn.createStatement();
    		return true;
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		return false;
    	}
    }
    
    public boolean disconnectDatabase()
    {
    	try
    	{
    		rs.close();
    		stat.close();
    		conn.close();
    		return true;
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		return false;
    	}
    }
    
    public boolean query(String sql)
    {
    	try
    	{
    		rs=stat.executeQuery(sql);
    		rsmd=rs.getMetaData();
    		return true;
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		return false;
    	}
    }
    
    public boolean execute(String sql)
    {
    	try
    	{
    		return stat.execute(sql);
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		return false;
    	}
    }
}