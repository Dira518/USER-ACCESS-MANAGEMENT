<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Form</title>
    <style>
        /* Sunrise gradient background for the body */
        body {
            background: radial-gradient(circle, #FFDEE9, #B5FFFC, #6E8EF9);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            font-family: Arial, sans-serif;
            color: #333;
        }

        /* Styling the form card */
        .card {
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            background: #ffffff;
            border: 1px solid #e0e0e0;
            padding: 20px;
        }

        /* Header with gradient */
        .card-header {
            background: linear-gradient(90deg, #FFD194, #D1913C);
            color: white;
            font-weight: bold;
            text-align: center;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            padding: 15px 0;
        }

        /* Styling the form labels */
        .form-group label {
            font-weight: bold;
            color: #444;
            display: block;
            margin-bottom: 5px;
        }

        /* Form inputs with hover effect */
        .form-control {
            width: 100%;
            padding: 10px;
            border-radius: 10px;
            border: 1px solid #ddd;
            background-color: #f4f4f4;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }
        .form-control:focus {
            background-color: #e9f0ff;
            box-shadow: 0 0 8px rgba(70, 130, 180, 0.3);
            border-color: #4682b4;
            outline: none;
        }

        /* Login button with a warm gradient */
        .btn-primary {
            width: 100%;
            padding: 10px;
            background: linear-gradient(90deg, #FF9A8B, #FF6A88);
            border: none;
            border-radius: 10px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        .btn-primary:hover {
            background: linear-gradient(90deg, #FF758C, #FF6A88);
        }

        /* Link color and hover effect */
        .card-footer a {
            color: #FF6A88;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }
        .card-footer a:hover {
            color: #FF758C;
            text-decoration: underline;
        }

        /* Success and error message styles */
        #sucess {
            color: #28a745;
            font-weight: bold;
        }

        #mesg {
            color: #dc3545;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card">
        <div class="card-header">
            <h3>Login</h3>
        </div>
        <div class="card-body">
            <form action="login" method="post">
                <div class="form-group">
                    <!-- Success message -->
                    <% String success = (String) request.getAttribute("success");
                       if (success != null) { %>
                        <p id="sucess"><%= success %></p>
                    <% } %>
                    
                    <label for="username">User Name</label>
                    <input type="text" name="username" class="form-control" id="username" placeholder="Enter username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" class="form-control" id="password" placeholder="Password" required>
                </div>
                <button type="submit" class="btn-primary">Login</button>

                <!-- Error message -->
                <% String mesg = (String) request.getAttribute("mesg");
                   if (mesg != null) { %>
                    <p id="mesg"><%= mesg %></p>
                <% } %>
            </form>
        </div>
        <div class="card-footer text-center">
            <small>Don't have an account? <a href="register.jsp">Create Account</a></small>
        </div>
    </div>
</div>

<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function () {
        let successEl = document.getElementById("sucess");

        if (successEl) {
            setTimeout(function () {
                successEl.innerText = "";
            }, 3000);
        }
    });
</script>

</body>
</html>
