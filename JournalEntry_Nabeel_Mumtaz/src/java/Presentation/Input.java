package Presentation;

import Database.moreandmoreobject;
import Database.moreobject;
import Database.object;
import javax.servlet.http.HttpServletRequest;

public class Input {

    private HttpServletRequest request;

    public Input(HttpServletRequest request) {
        this.request = request;
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public void gethtmldata() {

        
     
           
          String   entry =  request.getParameter("entry");
          String   content = request.getParameter("content");
           entry = (entry==null)?"":entry;
            content = (content==null)?"":content;
            new object(entry, content);
            
    
    }
        

    public void getdelvalue() {
          
       
         String del=request.getParameter("s1_t2_view");
          del = (del==null)?"":del;
            new moreobject(del);
        

        
    }

    public void getupdatevalue() {
           
        
             String update =request.getParameter("s1_t3_view");
             update = (update==null)?"":update;
        new moreandmoreobject(update);
        }
    
}
