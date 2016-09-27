package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import database.StateQueries;
import beans.User;
import java.net.*;

public final class newRestaurantForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>New Restaurant</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
 HttpSession ses = request.getSession(false); 
        User userId = (User) ses.getAttribute("utente");
        if (userId!=null) {   
      out.write("\n");
      out.write("        <form action=\"NewRestaurant\" method=\"post\">\n");
      out.write("            <input type=\"text\" maxlength=\"25\" required placeholder=\"nome*\" id=\"nome\" name=\"nome\">\n");
      out.write("            <input type=\"text\" maxlength=\"32000\" required placeholder=\"descrizione*\" id=\"descrizione\" name=\"descrizione\">\n");
      out.write("            <input type=\"url\" placeholder=\"URL sito\" id=\"URL_sito\" name=\"URL_sito\">\n");
      out.write("            <input type=\"tel\" pattern=\"\\d*\" placeholder=\"numero tel\" id=\"telefono\" name=\"telefono\">\n");
      out.write("            <input type=\"email\" placeholder=\"indrizzo email\" id=\"email\" name=\"email\">\n");
      out.write("            \n");
      out.write("            <input type=\"text\" maxlength=\"255\" placeholder=\"indrizzo\" id=\"indrizzo\" name=\"indrizzo\">\n");
      out.write("            \n");
      out.write("            <input type=\"number\" placeholder=\"CAP\" id=\"cap\" name=\"cap\">\n");
      out.write("            <input type=\"text\" maxlength=\"255\" placeholder=\"città\" id=\"citta\" name=\"citta\">\n");
      out.write("            <select name=\"stato\" >\n");
      out.write("                ");
  
                StateQueries sq = new StateQueries();
                ResultSet rs = sq.states();
                while (rs.next()) {
                
      out.write("\n");
      out.write("                    <option value=\"");
      out.print(rs.getString(1));
      out.write("\"> ");
      out.print(rs.getString(1));
      out.write(" </option>\n");
      out.write("                ");

                }  
                
      out.write("\n");
      out.write("            </select>\n");
      out.write("            <input type=\"submit\" value=\"create\"> <br>\n");
      out.write("        }\n");
      out.write("        else {\n");
      out.write("        %>\n");
      out.write("            ");
      if (true) {
        _jspx_page_context.forward("UserNotAuthenticated.html");
        return;
      }
      out.write("\n");
      out.write("        ");
 }
        
      out.write("\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
