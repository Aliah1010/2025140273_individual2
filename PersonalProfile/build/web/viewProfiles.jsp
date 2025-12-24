<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>All Student Profiles</title>
    <meta charset="UTF-8">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap');

        /* Star Pattern CSS */
        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        body {
            font-family: 'Hina Mincho', serif;
            background-color: #fcf4f8;
            color: #4682b4;
            padding: 30px;
            min-height: 100vh;
            margin: 0;
            overflow-x: hidden;
            position: relative;
        }

        body::before,
        body::after {
            content: '⭐';
            position: absolute;
            color: transparent;
            text-shadow: 0 0 0 #add8e6;
            z-index: 0;
        }

        body::before {
            top: 5%;
            left: 5%;
            font-size: 15vw;
            opacity: 0.5;
            transform: rotate(-15deg);
            animation: rotate 20s linear infinite;
        }

        body::after {
            top: 40%;
            right: 10%;
            font-size: 18vw;
            opacity: 0.4;
            transform: rotate(20deg);
            animation: rotate 30s linear infinite reverse;
        }

        .profile-card {
            background-color: #fff;
            padding: 35px 45px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(255, 182, 193, 0.5);
            max-width: 650px;
            width: 100%;
            margin: 30px auto;
            border: 2px solid #ffb6c1;
            position: relative;
            z-index: 1;
        }

        h2 {
            text-align: center;
            color: #6495ed;
            font-size: 2.8em;
            font-weight: normal;
            letter-spacing: 2px;
            margin-bottom: 30px;
            border-bottom: 3px solid #ffb6c1;
            padding-bottom: 10px;
        }

        .hobby-tags {
            text-align: center;
            margin-bottom: 20px;
        }

        .hobby-tags a {
            display: inline-block;
            padding: 5px 12px;
            margin: 4px;
            background-color: #add8e6;
            color: #2f4f4f;
            border-radius: 12px;
            text-decoration: none;
            font-weight: normal;
        }

        .hobby-tags a:hover {
            background-color: #6495ed;
            color: #fff;
        }

        .hobby-tags a.active {
            background-color: #6495ed;
            color: #fff;
        }

        .profile-item {
            background-color: #fffafa;
            border: 2px solid #ffb6c1;
            border-radius: 15px;
            padding: 15px;
            margin-bottom: 20px;
        }

        .label {
            display: inline-block;
            width: 140px;
            font-weight: normal;
            color: #2f4f4f;
        }

        .section-header {
            color: #6495ed;
            margin-top: 25px;
            margin-bottom: 10px;
            font-size: 1.4em;
            border-bottom: 2px dashed #ffb6c1;
            padding-bottom: 5px;
        }

        ul {
            list-style: none;
            padding-left: 15px;
            margin-top: 10px;
        }

        li {
            margin-bottom: 8px;
            padding: 3px 0;
        }

        li::before {
            content: '⭐';
            color: #87cefa;
            display: inline-block;
            width: 1.5em;
            margin-left: -1em;
            font-weight: bold;
        }

        .intro-box {
            background-color: #fffafa;
            border: 2px solid #ffb6c1;
            border-radius: 10px;
            padding: 10px 40px;
            line-height: 1.6;
            white-space: pre-wrap;
        }

        a.button-link {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 15px;
            background-color: #add8e6;
            color: #2f4f4f;
            border-radius: 12px;
            text-decoration: none;
            font-weight: normal;
        }

        a.button-link:hover {
            background-color: #6495ed;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="profile-card">
    <h2>All Student Profiles</h2>

<%
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/student_profiles", "app", "app");

    Set<String> allHobbies = new TreeSet<String>();
    Statement stmtHobbies = conn.createStatement();
    ResultSet rsHobbies = stmtHobbies.executeQuery("SELECT hobbies FROM profiles");
    while(rsHobbies.next()){
        String hs = rsHobbies.getString("hobbies");
        if(hs != null && !hs.trim().isEmpty()){
            String[] arr = hs.split(",");
            for(int i=0;i<arr.length;i++){
                String h = arr[i].trim();
                if(!h.isEmpty()) allHobbies.add(h);
            }
        }
    }
    rsHobbies.close();
    stmtHobbies.close();

    String search = request.getParameter("search");
%>

    <div class="hobby-tags">
    <%
        String allActive = (search == null || search.trim().isEmpty()) ? "active" : "";
    %>
        <a href="viewProfiles.jsp" class="<%= allActive %>">All</a>
    <%
        for(Iterator<String> it = allHobbies.iterator(); it.hasNext();){
            String hobby = it.next();
            String activeClass = (hobby.equals(search)) ? "active" : "";
    %>
        <a href="viewProfiles.jsp?search=<%= hobby %>" class="<%= activeClass %>"><%= hobby %></a>
    <%
        }
    %>
    </div>

<%
    String sql = "SELECT * FROM profiles";
    if(search != null && !search.trim().isEmpty()){
        sql = "SELECT * FROM profiles WHERE hobbies LIKE '%" + search + "%'";
    }
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);

    while(rs.next()){
%>
    <div class="profile-item">
        <div><span class="label">Name:</span> <%= rs.getString("name") %></div>
        <div><span class="label">Student ID:</span> <%= rs.getString("studentId") %></div>
        <div><span class="label">Program:</span> <%= rs.getString("program") %></div>
        <div><span class="label">Email:</span> <%= rs.getString("email") %></div>

        <div class="section-header">Hobbies</div>
        <ul>
        <%
            String hobbiesString = rs.getString("hobbies");
            if(hobbiesString != null && !hobbiesString.trim().isEmpty()){
                String[] arr = hobbiesString.split(",");
                for(int i=0;i<arr.length;i++){
                    String h = arr[i].trim();
                    if(!h.isEmpty()){
        %>
            <li><%= h %></li>
        <%
                    }
                }
            } else {
        %>
            <li>No specific hobbies listed.</li>
        <%
            }
        %>
        </ul>

        <div class="section-header">Self-introduction</div>
        <div class="intro-box"><%= rs.getString("intro") %></div>
    </div>
<%
    }
    stmt.close();
    conn.close();
%>

    <div style="text-align:center;">
        <a href="index.html" class="button-link">Back to Profile Form</a>
    </div>
</div>
</body>
</html>
