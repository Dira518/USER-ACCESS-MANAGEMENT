<%@page import="userDto.users"%>
<%@page import="userDto.software"%>
<%@page import="userDto.requests"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="userDao.RequestsDao" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Access Requests</title>
    <style>
        /* Background */
        body {
            background: linear-gradient(135deg, #E3FDFD, #FFE6FA);
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 20px;
        }

        /* Navbar styling */
        .navbar {
            width: 100%;
            background-color: #4A90E2;
            padding: 10px 20px;
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
        }

        .btn-logout {
            background-color: #D9534F;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Card styling */
        .card {
            background-color: #FFFFFF;
            border: 1px solid #ddd;
            border-radius: 12px;
            padding: 20px;
            width: 80%;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            margin-top: 20px;
        }

        /* Table styling */
        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th, .table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .table thead {
            background-color: #4A90E2;
            color: white;
        }

        /* Buttons styling */
        .btn-approve {
            background-color: #5CB85C;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-reject {
            background-color: #D9534F;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .card {
                width: 95%;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <span class="navbar-brand">User Management</span>
        <a href="login.jsp"><button class="btn-logout">LogOut</button></a>
    </div>

    <!-- Card for Access Requests -->
    <div class="card">
        <h2 style="text-align: center;">Pending Access Requests</h2>
        <form action="handleRequest" method="post">
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>User ID</th>
                        <th>Software ID(s)</th>
                        <th>Access Type</th>
                        <th>Reason</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<requests> pendingRequests = new RequestsDao().getPendingRequests();
                        if (!pendingRequests.isEmpty()) {
                            for (requests requ : pendingRequests) {
                                List<software> softwares = requ.getSoftware();
                                users user = requ.getUser();
                    %>
                    <tr>
                        <td><%= requ.getId() %></td>
                        <td><%= user != null ? user.getId() : "N/A" %></td>
                        <td>
                            <% if (softwares != null) {
                                for (software sof : softwares) { %>
                                    <div><%= sof.getId() %> - <%= sof.getName() %></div>
                            <%  }
                            } else { %>
                                <div>N/A</div>
                            <% } %>
                        </td>
                        <td><%= requ.getAccess_type() != null ? requ.getAccess_type() : "N/A" %></td>
                        <td><%= requ.getReason() != null ? requ.getReason() : "N/A" %></td>
                        <td>
                            <button type="submit" name="action" value="approve_<%= requ.getId() %>" class="btn-approve">Approve</button>
                            <button type="submit" name="action" value="reject_<%= requ.getId() %>" class="btn-reject">Reject</button>
                        </td>
                    </tr>
                    <%      }
                        } else { %>
                        <tr>
                            <td colspan="6" style="text-align: center;">No pending requests</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </form>
    </div>
</body>
</html>
