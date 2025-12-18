<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.profile.model.ProfileBean" %>
<%
    ProfileBean profile = (ProfileBean) request.getAttribute("profile");
%>
<html>
<head>
    <title>My Profile Output</title>
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
            max-width: 600px;
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

        .detail-row {
            margin-bottom: 18px;
            padding: 10px;
            border-left: 6px solid #ffb6c1;
            background-color: #fffafa;
            border-radius: 5px;
        }

        .label {
            display: inline-block;
            width: 160px;
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
            line-height: 1.8;
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
    <h2>My Profile (๑•ᴗ•๑)♡</h2>

    <div class="detail-row"><span class="label">Name:</span> <%= profile.getName() %></div>
    <div class="detail-row"><span class="label">Student ID:</span> <%= profile.getStudentId() %></div>
    <div class="detail-row"><span class="label">Program:</span> <%= profile.getProgram() %></div>
    <div class="detail-row"><span class="label">Email:</span> <%= profile.getEmail() %></div>

    <div class="section-header">Hobbies</div>
    <ul>
        <%
            String hobbiesString = profile.getHobbies();
            if(hobbiesString != null && !hobbiesString.trim().isEmpty()) {
                for(String h: hobbiesString.split(",")) {
                    if(!h.trim().isEmpty()){
        %>
            <li><%= h.trim() %></li>
        <%
                    }
                }
            } else {
        %>
            <li>No specific hobbies were listed.</li>
        <%
            }
        %>
    </ul>

    <div class="section-header">Self-introduction</div>
    <div class="intro-box"><%= profile.getIntro() %></div>

    <div style="text-align:center; margin-top:20px;">
        <a href="viewProfiles.jsp" class="button-link">View All Profiles</a>
    </div>
</div>
</body>
</html>
