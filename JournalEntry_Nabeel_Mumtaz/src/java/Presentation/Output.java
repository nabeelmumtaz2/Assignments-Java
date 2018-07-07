
package Presentation;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;

public class Output {

    private HttpServletResponse response;

    public HttpServletResponse getResponse() {
        return response;
    }

    public void setResponse(HttpServletResponse response) {
        this.response = response;
    }

    public Output(HttpServletResponse response) {
        this.response = response;
    }
    public void htmlgeneratoranddisplayoutput() throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title></title>");
            
           
           //out.println("<meta http-equiv=\"refresh\" content=\""+rows+";"+" URL=\"http://localhost:8080/JournalEntry_Nabeel_Mumtaz/myservlet\">");
          
            out.println("</head>");
            out.println(" <link rel=\"stylesheet\" type=\"text/css\" href=\"newcss.css\">");
            out.println("<body>");

            out.println(" <form method=\"post\" action=\"myservlet\">\n"
                    + "            <input type=\"text\" id=\"entry\" placeholder=\"What's on your mind?\" name=\"entry\">\n"
                    + "            \n"
            );
            out.println("<button type=\"submit\" id=\"submit\" >Add new entry</button>");
          
            out.println("</form>");
            out.println((Database.moreobject.getDel()));
            out.println(Database.moreandmoreobject.getUpdate());

            for (int i = 0; i < Database.dbconnection.title.size(); i++) {
                out.println("<br>");
                out.println("<h2>");
                
                out.println(Database.dbconnection.title.get(i));
                out.println("</h2>");
                out.println("<form method=\"post\" action=\"myservlet\">\n ");
                out.println("<textarea rows=\"4\" id=\"content\" name=\"content\" cols=\"50\"></textarea>");
                out.println("<h3>");
                out.println("<button type=\"submit\">Submit!</button>");
                out.println("<h3>");

                // out.println("<button type=\"submit\">Delete!</button>");
                out.println("<input type=\"checkbox\" name=\"s1_t2_view\" value=" + Database.dbconnection.title.get(i) + " >Delete");
                out.println("<input type=\"checkbox\" name=\"s1_t3_view\" value=" + Database.dbconnection.title.get(i) + " >Update");
                out.println("<br>");
                out.println("<h3>");
                out.println(Database.dbconnection.postdate.get(i));
                out.println("</h3>");
                out.println("<hr>");
                out.println("</form>");

            }
            for (int i = 0; i < Database.dbconnection.content.size(); i++) {
                out.println("<br>");
                out.println("<h3>");
                out.println(Database.dbconnection.content.get(i));
                out.println("</h3>");
            }
            out.println("</body>");
            out.println("</html>");
             
        }
       
        Database.dbconnection.title.clear();
        Database.dbconnection.postdate.clear();
        Database.dbconnection.content.clear();
       
    }

}
