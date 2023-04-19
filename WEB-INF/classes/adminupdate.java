import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.DriverManager.*;
import java.sql.*;

public class adminupdate extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {
        Connection con = null;
        Statement stmt = null;
        PreparedStatement ps = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        int f = 0;
        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/practice", "postgres", "bala");
            stmt = con.createStatement();
            ResultSet owner_page_details = stmt.executeQuery("Select * from hotel_rooms;");
            while (owner_page_details.next()) {
                String room_no = request.getParameter("room_no");
                String type = request.getParameter("type");
                String bed = request.getParameter("bed");
                String floor = request.getParameter("floor");
                String avail = request.getParameter("avail");
                String old = request.getParameter("old_room_no");
                String amount = request.getParameter("rate");
                if (owner_page_details.getString(1).equals(old)) {

                    while (owner_page_details.next()) {
                        if (owner_page_details.getString(1) != room_no) {
                            ps = con.prepareStatement(
                                    "update hotel_rooms set type_of_room=?,bed=?,floor=?,room_no=?,rate=?,availabilty=? where room_no=?;");
                            ps.setString(1, type);
                            ps.setString(2, bed);
                            ps.setString(3, floor);
                            ps.setString(4, room_no);
                            ps.setString(5, amount);
                            ps.setString(6, avail);
                            ps.setString(7, old);
                            ps.execute();
                            f = 1;
                            ps1 = con.prepareStatement("update hotel_rooms set  availabilty='no' where room_no=?;");
                            ps1.setString(1, room_no);
                            ps1.execute();
                            // pw.write("<script>alert('successfully updated');</script>");

                            ps2 = con.prepareStatement("update hotel_rooms set  availabilty='yes' where room_no=?;");
                            ps2.setString(1, old);
                            ps2.execute();

                        }
                    }
                    pw.write("<script>alert(\"success fully updated\");location=\"http://localhost:8080/hotel_management/adminupdate.jsp\";</script>");
                    
                    if (f == 0) {
                        pw.write("<script>alert('Sorry your details is in valid');</script>");
                        // pw.write("Sucess");
                    }

                }
            }
        }

        catch (Exception e) {
            pw.write("<script>alert('Sorry your details is in valid');</script>");
        }
        pw.write(
                "<button><a href='http://localhost:8080/hotel_management/admin_homepage.jsp'><h1>go to home age</h1></a></button>");
        pw.close();
    }
}
