import jakarta.servlet.*;
import jakarta.servlet.RequestDispatcher.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.DriverManager.*;
import java.sql.*;
import jakarta.servlet.http.HttpSession;
public class update extends HttpServlet{
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
                    String days=request.getParameter("days");
                    String date=request.getParameter("date");
                    String old=request.getParameter("old_room_no");
                    // String type=request.getParameter("type");
                    // String bed=request.getParameter("bed");
                    // String floor=request.getParameter("floor");
                  
                    String amount=null;
                    try{
                        HttpSession session=request.getSession();

                        session.setMaxInactiveInterval(10);
                        long currentTime = System.currentTimeMillis();
                        session.setAttribute("creationTime", currentTime);
                        long expireTime = currentTime + (60 * 1000);
                        session.setAttribute("expireTime", expireTime);
                        res.setHeader("Refresh", "10; URL=setadminurl.jsp?page=admin_homepage.jsp");

                        String ema=session.getAttribute("email").toString();

                        if(ema.equals("null")){
                            session.setAttribute("urlname","hotel_options.jsp");
                            session.setAttribute("urlname1","null");
                            res.sendRedirect("welcome.html");
                        }

                        Class.forName("org.postgresql.Driver");
                        con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/practice","postgres","bala");
                        stmt=con.createStatement();
                        ResultSet owner_page_details = stmt.executeQuery("Select * from hotel_rooms;"); 
                        //pw.write(room_no);
                         while(owner_page_details.next()){
                        //pw.write(type);
                            if(owner_page_details.getString(1).equals(old) && owner_page_details.getString(6).equals("no")){
                                while(owner_page_details.next()){
                                    if( owner_page_details.getString(1)!=room_no){
                                        String type=owner_page_details.getString(2);
                                        String bed=owner_page_details.getString(3);
                                        String floor=owner_page_details.getString(4);
                                // pw.write("well done");
                                amount=owner_page_details.getString(5);
                              // pw.write(amount);
                               int amounts= Integer.parseInt(amount) *Integer.parseInt(days);
                               String amoun=Integer.toString(amounts);
                               //pw.write(room_no+" "+type+" "+bed+" "+floor+" "+old+" "+amoun+" "+date+" "+days);
                         ps=con.prepareStatement("update booking set type_of_room=?,bed=?,floor=?,room_no=?,date=?,no_of_days=?,amount=? where room_no=?;");
                        ps.setString(1,type);
                        ps.setString(2, bed);
                        ps.setString(3, floor);
                        ps.setString(4, room_no);
                        ps.setString(5, date);
                        ps.setString(6, days);
                        ps.setString(7, amoun);
                        ps.setString(8, old);
                        ps.execute();  
                        f=1;
                        ps1=con.prepareStatement("update hotel_rooms set  availabilty='no' where room_no=?;");
                        ps1.setString(1, room_no);
                        ps1.execute();
                        // pw.write("<script>alert('successfully updated');</script>");

                        ps2=con.prepareStatement("update hotel_rooms set  availabilty='yes' where room_no=?;");
                        ps2.setString(1, old);
                        ps2.execute();
                        pw.write("<script>location=\"http://localhost:8080/hotel_management/home_page.jsp\";alert('The Successfully Updated');</script>");
                        break;  
                        }
                    }
                }
                   
                        
                     
                    }
                    if(f==0){
                        pw.write("<script>location=\"http://localhost:8080/hotel_management/homepage.jsp\";alert('The Entered Room Number is Incorrect');</script>");
                        //pw.write("Sucess");
                    }
                      }catch(Exception e){
                
                }
                pw.write("<button><a href='http://localhost:8080/hotel_management/homepage.jsp'><h1>go to home age</h1></a></button>");
                pw.close(); 
                
                }    
                
					
            }
	
