/**
*This is populate.java
*It is used for insert data into tables
*@author yang
**/
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.io.*;

public class populate
{
	//Some variables which are used for connect with database system
	public static final String oracleDriver = "oracle.jdbc.driver.OracleDriver";
	public static final String oracleURL = "jdbc:oracle:thin:@localhost:1521:MLDN";
	public static final String oracleUser = "scott";
	public static final String oraclePassword = "tiger";

	public static void main(String[] args) throws Exception,IOException
	{
		//IO operation for animals.txt
		String str1 = null;
		File f1 = new File(args[0]);
		FileReader fr1 = new FileReader(f1);
		BufferedReader br1 = new BufferedReader(fr1);
        
		//IO operation for trucks.txt
	    String str2 = null;
		File f2 = new File(args[1]);
		FileReader fr2 = new FileReader(f2);
		BufferedReader br2 = new BufferedReader(fr2);

        //IO operation for vaccines.txt
		String str3 = null;
		File f3 = new File(args[2]);
		FileReader fr3 = new FileReader(f3);
		BufferedReader br3 = new BufferedReader(fr3);
 
        //Connect with oracle
		Connection conn = null;
		Class.forName(oracleDriver);
        conn = DriverManager.getConnection(oracleURL,oracleUser,oraclePassword);
        
		PreparedStatement psAnimal = null;
		PreparedStatement psTruck = null;
		PreparedStatement psVaccine = null;

        //Use loop to insert the data in animals.txt into table in database system
		while ((str1 = br1.readLine()) != null)
		{ 
		   String [] res = str1.split(", ");
		
		   String sql = "INSERT INTO animals VALUES(?,?,SDO_GEOMETRY(2001,NULL,SDO_POINT_TYPE(?,?,NULL),NULL,NULL))";
		   psAnimal = conn.prepareStatement(sql);
		   psAnimal.setInt(1,new Integer(res[0]));
		   psAnimal.setString(2,res[1]);
		   psAnimal.setInt(3,new Integer(res[2]));
		   psAnimal.setInt(4,new Integer(res[3]));
		   psAnimal.executeUpdate();
        }
        br1.close();
		psAnimal.close();

        //Use loop to insert the data in trucks.txt into table in database system
		while ((str2 = br2.readLine()) != null)
		{ 
		   String [] res = str2.split(", ");
		   String sql = "INSERT INTO trucks VALUES(?,?,SDO_GEOMETRY(2001,NULL,SDO_POINT_TYPE(?,?,NULL),NULL,NULL),?)";
		   psTruck = conn.prepareStatement(sql);
		   psTruck.setInt(1,new Integer(res[0]));
		   psTruck.setString(2,res[1]);
		   psTruck.setInt(3,new Integer(res[2]));
		   psTruck.setInt(4,new Integer(res[3]));
		   psTruck.setString(5,res[4]);
		   psTruck.executeUpdate();
        }
        br2.close();
		psTruck.close();
        
		//Use loop to insert the data in vaccines.txt into table in database system
		while ((str3 = br3.readLine()) != null)
		{ 
		   String [] res = str3.split(",");
		
		   String sql = "INSERT INTO vaccines VALUES(?,?,?)";
		   psVaccine = conn.prepareStatement(sql);
		   psVaccine.setString(1,res[0]);
		   psVaccine.setString(2,res[1]);
		   psVaccine.setString(3,res[2]);
		   psVaccine.executeUpdate();
        }
		br3.close();
		psVaccine.close();
        conn.close();//Close the connection
	}
}