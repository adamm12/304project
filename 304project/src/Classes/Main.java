package Classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class Main {

	
	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:ug",  "ora_z5r8", "a34072124");
		
		// Sample SQL selection query
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM personnel");
		
		// Initialize variables to store the data from DB
		long id = 0;
		String pname = "";
		long phone = 0;
		Date hireDate = null;
		long airlineId = 0;
		
		while(rs.next()) {
			// Get the column values
			id = rs.getLong(1);
			pname = rs.getString(2);
		    phone = rs.getLong(3);
			hireDate = rs.getDate(4);
			airlineId = rs.getLong(5);
			
			// Print the result to console
			System.out.println("Personnel id is: " + id);
			System.out.println("Personnel name is; " + pname);
			System.out.println("Personnel phone# is: " + phone);
			System.out.println("Hire date is; " + hireDate);
			System.out.println("Airline Id is: " + airlineId);
		}
		
		rs.close();
	}

}
