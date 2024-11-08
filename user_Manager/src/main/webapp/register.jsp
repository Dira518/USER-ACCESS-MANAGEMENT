<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>
        /* Background and overall layout */
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
        .container {
            width: 100%;
            max-width: 500px;
            margin: 0 auto;
            padding-top: 5vh;
        }

        /* Card styling */
        .card {
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            background: #fefefe;
            border: 1px solid #e0e0e0;
            padding: 20px;
        }

        /* Card header with gradient */
        .card-header {
            background: linear-gradient(90deg, #FFAA85, #B3315F);
            color: white;
            font-weight: bold;
            text-align: center;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            padding: 15px 0;
        }

        /* Form group styling */
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-weight: bold;
            color: #444;
            display: block;
            margin-bottom: 5px;
        }

        /* Form control styling with focus effect */
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

        /* Button styling with hover effect */
        .btn-primary {
            width: 100%;
            padding: 10px;
            background: linear-gradient(90deg, #FF758C, #FF7EB3);
            border: none;
            border-radius: 10px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        .btn-primary:hover {
            background: linear-gradient(90deg, #FF5A76, #FF7EB3);
        }

        /* Footer link styling */
        .card-footer {
            text-align: center;
            padding: 10px 0;
        }
        .card-footer a {
            color: #FF7EB3;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }
        .card-footer a:hover {
            color: #FF5A76;
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card">
        <div class="card-header">
            <h3>Register</h3>
        </div>
        <div class="card-body">
            <form action="register" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" name="name" class="form-control" id="username" placeholder="Enter username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" class="form-control" id="password" placeholder="Enter password" required>
                </div>
                <div class="form-group">
                    <label for="role">Role</label>
                    <select class="form-control" id="role" name="role" required>
                        <option value="">Select role</option>
                        <option value="employee">Employee</option>
                        <option value="manager">Manager</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>
                <button type="submit" class="btn-primary">Register</button>
            </form>
        </div>
        <div class="card-footer">
            <small>Already registered? <a href="login.jsp">Go to Login</a></small>
        </div>
    </div>
</div>

</body>
</html>
