<%@page import="java.util.List"%>
<%@page import="userDto.software"%>
<%@page import="userDao.SoftwareDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Software Request</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9; /* Light grey background */
            color: #333; /* Dark text for readability */
            margin: 0;
            padding: 0;
        }

        /* Navbar Styling */
        nav {
            background-color: #0066cc; /* Dark blue background */
            padding: 10px;
            color: white;
            text-align: center;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-size: 16px;
        }

        nav button {
            background-color: #ff4d4d; /* Red logout button */
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        nav button:hover {
            background-color: #e60000; /* Darker red on hover */
        }

        /* Centered form styling */
        .centered-form {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh; /* Full viewport height */
        }

        .form-container {
            background-color: white; /* White background for the form */
            padding: 30px;
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            width: 100%;
            max-width: 600px; /* Max width for the form */
        }

        h2 {
            text-align: center;
            color: #333;
        }

        /* Input and select styling */
        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-size: 16px;
            color: #333;
            display: block;
            margin-bottom: 8px;
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input:focus, select:focus, textarea:focus {
            border-color: #0066cc; /* Blue border on focus */
            outline: none;
        }

        textarea {
            resize: vertical; /* Allow vertical resizing only */
        }

        .btn-submit {
            background-color: #0066cc; /* Blue submit button */
            color: white;
            padding: 10px 20px;
            border: none;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s;
            width: 100%;
        }

        .btn-submit:hover {
            background-color: #004d99; /* Darker blue on hover */
        }

        .success-message {
            color: green;
            text-align: center;
            margin-bottom: 20px;
        }

    </style>
</head>
<body>
    <nav>
        <span>User Management</span>
        <a href="login.jsp"><button>LogOut</button></a>
    </nav>

    <div class="centered-form">
        <div class="form-container">
            <h2>Software Request Form</h2>

            <% 
                String added = (String) request.getAttribute("added");
                if (added != null) {
                    out.print("<p class='success-message'>" + added + "</p>");
                }
            %>

            <form action="requestAccess" method="post">
                <!-- Software Dropdown -->
                <div class="form-group">
                    <label for="software">Select Software</label>
                    <select class="form-control" id="software" name="software" required>
                        <% 
                            List<software> l = new SoftwareDao().fetchSoftware();
                            if (l != null) {
                                for (software s : l) {
                        %>
                                    <option value="<%= s.getId() + " " + s.getName() %>">
                                        <%= s.getId() + " " + s.getName() %>
                                    </option>
                        <% 
                                }
                            } else {
                        %>
                                    <option value="">No softwares currently</option>
                        <% 
                            }
                        %>
                    </select>
                </div>

                <!-- Access Type -->
                <div class="form-group">
                    <label for="access">Access type</label>
                    <select class="form-control" id="access" name="access">
                        <option value="read">Read</option>
                        <option value="write">Write</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>

                <!-- Reason Text Area -->
                <div class="form-group">
                    <label for="reason">Reason for Request</label>
                    <textarea class="form-control" id="reason" name="reason" placeholder="Enter your reason here..." rows="4" required></textarea>
                </div>

                <!-- Submit Button -->
                <div class="form-group">
                    <button type="submit" class="btn-submit">Request</button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>
