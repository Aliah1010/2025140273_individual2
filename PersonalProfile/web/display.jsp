<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" %>
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
            padding-bottom: 50px; 
            overflow-x: hidden; 
            position: relative; 
            background-size: 20px 20px; 
        }

        /* Stars */
        body::before {
            content: '⭐';
            position: absolute;
            top: 5%;
            left: 5%;
            font-size: 15vw; 
            color: transparent; 
            text-shadow: 0 0 0 #add8e6; 
            opacity: 0.5; 
            transform: rotate(-15deg);
            z-index: 0; 
            animation: rotate 20s linear infinite;
        }
        body::after {
            content: '⭐';
            position: absolute;
            top: 40%; 
            right: 10%;
            font-size: 18vw; 
            color: transparent; 
            text-shadow: 0 0 0 #add8e6; 
            opacity: 0.4;
            transform: rotate(20deg);
            z-index: 0; 
            animation: rotate 30s linear infinite reverse;
        }
        
        .profile-card {
            background-color: #ffffff;
            padding: 45px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(255, 182, 193, 0.5); 
            width: 100%;
            max-width: 600px;
            border: 3px solid #87cefa; 
            margin: 30px auto; 
            z-index: 1; 
            position: relative; 
        }
        h2 {
            text-align: center;
            color: #6495ed; 
            margin-bottom: 30px;
            font-size: 3em;
            font-weight: normal;
            letter-spacing: 2px;
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
            font-weight: normal;
            color: #2f4f4f; 
            display: inline-block;
            width: 160px;
            font-size: 1.1em;
        }
        .section-header {
            color: #6495ed; 
            font-weight: normal;
            margin-top: 40px;
            margin-bottom: 10px; 
            border-bottom: 2px dashed #ffb6c1; 
            padding-bottom: 5px;
            font-size: 1.4em;
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
            font-weight: bold;
            display: inline-block;
            width: 1.5em;
            margin-left: -1em;
        }
        .intro-box {
            background-color: #fffafa; 
            border: 2px solid #ffb6c1; 
            padding: 10px 45px 10px 50px; 
            border-radius: 10px;
            white-space: pre-wrap;
            box-sizing: border-box;
            line-height: 1.8;
            min-height: 120px;
            font-size: 1.05em;
            width: 100%;
            text-align: left; 
        }
    </style>
</head>
<body>
    <div class="profile-card">

        <h2>My Profile (๑•ᴗ•๑)♡</h2>

        <div class="detail-row"><span class="label">Name:</span> <%= request.getAttribute("name") %></div>
        <div class="detail-row"><span class="label">Student ID:</span> <%= request.getAttribute("studentId") %></div>
        <div class="detail-row"><span class="label">Program:</span> <%= request.getAttribute("program") %></div>
        <div class="detail-row"><span class="label">Email:</span> <%= request.getAttribute("email") %></div>
        
        <div class="section-header">Hobbies</div>
        <ul>
        <%
            String hobbiesString = (String) request.getAttribute("hobbiesString");
            if (hobbiesString != null && !hobbiesString.trim().isEmpty()) {
                String[] hobbies = hobbiesString.split(",");
                for (String h : hobbies) {
                    String trimmedHobby = h.trim();
                    if (!trimmedHobby.isEmpty()) {
        %>
                        <li><%= trimmedHobby %></li>
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
        <div class="intro-box">
            <%= request.getAttribute("intro") %>
        </div>

    </div>
</body>
</html>
