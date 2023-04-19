import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.http.HttpSession;
import java.io.*;
import java.sql.DriverManager.*;
import java.sql.*;
	public class search extends HttpServlet
	{
				public void doGet(HttpServletRequest request,HttpServletResponse res) throws ServletException,IOException
				{
					res.setContentType("text/html");
					PrintWriter pw=res.getWriter();
					String type=request.getParameter("type");
					// String bed=request.getParameter("bed");
					// String floor=request.getParameter("floor");
					// pw.print(type);
					Connection con=null;
					Statement stmt=null;
				try{
					HttpSession session=request.getSession();
					String ema=session.getAttribute("email").toString();
					if(ema.equals("null")){
						session.setAttribute("urlname","home_page.jsp");
      					session.setAttribute("urlname1","null");
						res.sendRedirect("welcome.html");
					}
					Class.forName("org.postgresql.Driver");
					con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/practice","postgres","bala");
					stmt=con.createStatement();
					PreparedStatement ps=con.prepareStatement("Select * from hotel_rooms where type_of_room=?;");
					ps.setString(1,type);
					ResultSet owner_page_details = ps.executeQuery(); 

					pw.write("<div class=\"tab\">");
					pw.write("<table  border=\"8px solid black;\" style=\"width:500px;height:65%;background-color:yellow;margin:auto;text-align:center;font-size:25px;\" class=\"center\" >");   
     
					pw.write("<tr style=\"text-align:center;\"><h1>Available Rooms</h1></tr>");
					pw.write("<tr><td><b>Room_no</b></td><td><b>Type_of_room</b></td><td><b>Bed_Count</b></td><td><b>Floor</b></td><td><b>Rate per Day</b></td><td><b>Availability</b></td></tr>");
				 
					//pw.write("<table>");

					while(owner_page_details.next()){
						pw.write("<tr><td>"+owner_page_details.getString(1)+"</td><td>"+owner_page_details.getString(2)+"</td><td>"+owner_page_details.getString(3)+
						"</td><td>"+owner_page_details.getString(4)+"</td><td>"+owner_page_details.getString(5)+"</td><td>"+owner_page_details.getString(6)+"</td></tr>");
			 			pw.write("<br>");   
					}
					pw.write("</table><br>");
					pw.write("</div>");
		}
		catch(Exception e){
			
		}
		pw.write("<button><a href=\"http://localhost:8080/hotel_management/home_page.jsp\">back to home page</a></button>");
		pw.close();

		}
		
	}