package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.profile.model.ProfileBean;

public final class profile_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
      out.write('\n');

    ProfileBean profile = (ProfileBean) request.getAttribute("profile");

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>My Profile Output</title>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <style>\n");
      out.write("        @import url('https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap');\n");
      out.write("\n");
      out.write("        @keyframes rotate { from { transform: rotate(0deg);} to { transform: rotate(360deg);} }\n");
      out.write("\n");
      out.write("        body {\n");
      out.write("            font-family: 'Hina Mincho', serif;\n");
      out.write("            background-color: #fcf4f8;\n");
      out.write("            color: #4682b4;\n");
      out.write("            padding: 30px;\n");
      out.write("            min-height: 100vh;\n");
      out.write("            margin: 0;\n");
      out.write("            overflow-x: hidden;\n");
      out.write("            position: relative;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        body::before,\n");
      out.write("        body::after {\n");
      out.write("            content: '⭐';\n");
      out.write("            position: absolute;\n");
      out.write("            color: transparent;\n");
      out.write("            text-shadow: 0 0 0 #add8e6;\n");
      out.write("            z-index: 0;\n");
      out.write("        }\n");
      out.write("        body::before { top:5%; left:5%; font-size:15vw; opacity:0.5; transform:rotate(-15deg); animation:rotate 20s linear infinite; }\n");
      out.write("        body::after  { top:40%; right:10%; font-size:18vw; opacity:0.4; transform:rotate(20deg); animation:rotate 30s linear infinite reverse; }\n");
      out.write("\n");
      out.write("        .profile-card {\n");
      out.write("            background-color: #fff;\n");
      out.write("            padding: 35px 45px;\n");
      out.write("            border-radius: 20px;\n");
      out.write("            box-shadow: 0 10px 30px rgba(255,182,193,0.5);\n");
      out.write("            max-width: 600px; width: 100%;\n");
      out.write("            margin: 30px auto;\n");
      out.write("            border: 2px solid #ffb6c1;\n");
      out.write("            position: relative; z-index: 1;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        h2 {\n");
      out.write("            text-align: center;\n");
      out.write("            color: #6495ed;\n");
      out.write("            font-size: 2.8em;\n");
      out.write("            font-weight: normal;\n");
      out.write("            letter-spacing: 2px;\n");
      out.write("            margin-bottom: 30px;\n");
      out.write("            border-bottom: 3px solid #ffb6c1;\n");
      out.write("            padding-bottom: 10px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .detail-row {\n");
      out.write("            margin-bottom: 18px;\n");
      out.write("            padding: 10px;\n");
      out.write("            border-left: 6px solid #ffb6c1;\n");
      out.write("            background-color: #fffafa;\n");
      out.write("            border-radius: 5px;\n");
      out.write("        }\n");
      out.write("        .label { display: inline-block; width: 160px; font-weight: normal; color: #2f4f4f; }\n");
      out.write("\n");
      out.write("        .section-header {\n");
      out.write("            color: #6495ed;\n");
      out.write("            margin-top: 25px;\n");
      out.write("            margin-bottom: 10px;\n");
      out.write("            font-size: 1.4em;\n");
      out.write("            border-bottom: 2px dashed #ffb6c1;\n");
      out.write("            padding-bottom: 5px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        ul { list-style: none; padding-left: 15px; margin-top: 10px; }\n");
      out.write("        li { margin-bottom: 8px; padding: 3px 0; }\n");
      out.write("        li::before { content: '⭐'; color: #87cefa; display: inline-block; width: 1.5em; margin-left: -1em; font-weight: bold; }\n");
      out.write("\n");
      out.write("        .intro-box {\n");
      out.write("            background-color: #fffafa;\n");
      out.write("            border: 2px solid #ffb6c1;\n");
      out.write("            border-radius: 10px;\n");
      out.write("            padding: 10px 40px;\n");
      out.write("            line-height: 1.8;\n");
      out.write("            white-space: pre-wrap;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        a { display: inline-block; margin-top: 20px; text-decoration: none; color: #4682b4; }\n");
      out.write("        a:hover { color: #ff69b4; }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<div class=\"profile-card\">\n");
      out.write("    <h2>My Profile (๑•ᴗ•๑)♡</h2>\n");
      out.write("\n");
      out.write("    <div class=\"detail-row\"><span class=\"label\">Name:</span> ");
      out.print( profile.getName() );
      out.write("</div>\n");
      out.write("    <div class=\"detail-row\"><span class=\"label\">Student ID:</span> ");
      out.print( profile.getStudentId() );
      out.write("</div>\n");
      out.write("    <div class=\"detail-row\"><span class=\"label\">Program:</span> ");
      out.print( profile.getProgram() );
      out.write("</div>\n");
      out.write("    <div class=\"detail-row\"><span class=\"label\">Email:</span> ");
      out.print( profile.getEmail() );
      out.write("</div>\n");
      out.write("\n");
      out.write("    <div class=\"section-header\">Hobbies</div>\n");
      out.write("    <ul>\n");
      out.write("        ");

            String hobbiesString = profile.getHobbies();
            if(hobbiesString != null && !hobbiesString.trim().isEmpty()) {
                for(String h: hobbiesString.split(",")) {
                    if(!h.trim().isEmpty()){
        
      out.write("\n");
      out.write("            <li>");
      out.print( h.trim() );
      out.write("</li>\n");
      out.write("        ");

                    }
                }
            } else {
        
      out.write("\n");
      out.write("            <li>No specific hobbies were listed.</li>\n");
      out.write("        ");

            }
        
      out.write("\n");
      out.write("    </ul>\n");
      out.write("\n");
      out.write("    <div class=\"section-header\">Self-introduction</div>\n");
      out.write("    <div class=\"intro-box\">");
      out.print( profile.getIntro() );
      out.write("</div>\n");
      out.write("\n");
      out.write("    <div style=\"text-align:center; margin-top:20px;\">\n");
      out.write("        <a href=\"viewProfiles.jsp\" class=\"intro-box\">View All Profiles</a>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("</body>\n");
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
