import jakarta.servlet.*;
import jakarta.servlet.RequestDispatcher.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.DriverManager.*;
import java.sql.*;
public class delete extends HttpServlet{
				public void doGet(HttpServletRequest request,HttpServletResponse res) throws ServletException,IOException
				{
                    Connection con=null;
                    Statement stmt=null;
                    PreparedStatement ps=null;
                    PreparedStatement ps1=null;
                    PreparedStatement ps2=null;
                    int f=0;
                    res.setContentType("text/html");
                    PrintWriter pw=res.getWriter();
                    String room_no=request.getParameter("room_no");
                    // String days=request.getParameter("days");
                    // String date=request.getParameter("date");
                    // String old=request.getParameter("old_room_no");
                    // String type=request.getParameter("type");
                    // String bed=request.getParameter("bed");
                    // String floor=request.getParameter("floor");
                  
                    String amount=null;
                    try{
                        Class.forName("org.postgresql.Driver");
                        con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/practice","postgres","bala");
                        stmt=con.createStatement();
                        ResultSet owner_page_details = stmt.executeQuery("Select * from hotel_rooms;"); 
                        //pw.write(room_no);
                         while(owner_page_details.next()){
                        //pw.write(type);
                            if(owner_page_details.getString(1).equals(room_no)){
                                // while(owner_page_details.next()){
                                //     if( owner_page_details.getString(1)!=room_no){
                                // String type=owner_page_details.getString(2);
                                // String bed=owner_page_details.getString(3);
                                // String floor=owner_page_details.getString(4);
                                // pw.write("well done");
                                //amount=owner_page_details.getString(5);
                              // pw.write(amount);
                            //    int amounts= Integer.parseInt(amount) *Integer.parseInt(days);
                            //    String amoun=Integer.toString(amounts);
                               //pw.write(room_no+" "+type+" "+bed+" "+floor+" "+old+" "+amoun+" "+date+" "+days);
                         ps=con.prepareStatement("delete booking where room_no=?;");
                        ps.setString(1, room_no);
                        // ps.setString(5, date);
                        // ps.setString(6, days);
                        // ps.setString(7, amoun);
                        // ps.setString(8, old);
                        ps.execute();  
                        f=1;
                        ps1=con.prepareStatement("update hotel_rooms set  availabilty='no' where room_no=?;");
                        ps1.setString(1, room_no);
                        ps1.execute();
                        // pw.write("<script>alert('successfully updated');</script>");

                        // ps2=con.prepareStatement("delete booking where room_no=?;");
                        // ps2.setString(1, old);
                        // ps2.execute();
                        pw.write("<script>location=\"http://localhost:8080/hotel_management/home_page.jsp\";alert('The Successfully Deleted');</script>");
                        break;  
                        //}
                    //}
                }
                   
                        
                     
                    }
                    if(f==0){
                        pw.write("<script>location=\"http://localhost:8080/hotel_management/home_page.jsp\";alert('The Entered Room Number is Incorrect');</script>");
                        //pw.write("Sucess");
                    }
                      }catch(Exception e){
                
                }
                pw.write("<button><a href='http://localhost:8080/hotel_management/home_page.jsp'><h1>go to home age</h1></a></button>");
                pw.close(); 
                
                }    
                
					
            }
	

    

