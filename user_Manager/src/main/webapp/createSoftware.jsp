<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Software</title>
    <style>
        /* Basic reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Navbar styling */
        .navbar {
            background-color: #007bff;
            color: white;
            padding: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
            color: white;
        }

        .navbar a.btn-logout {
            background-color: #dc3545;
            color: white;
            padding: 0.5rem 1rem;
            border: none;
            cursor: pointer;
            text-decoration: none;
            border-radius: 5px;
        }

        .navbar a.btn-logout:hover {
            background-color: #c82333;
        }

        /* Center the form vertically */
        .centered-form {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f8f9fa;
        }

        .form-container {
            width: 100%;
            max-width: 500px;
            padding: 2rem;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 1.5rem;
            color: #333;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #555;
        }

        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ced4da;
            border-radius: 4px;
            font-size: 1rem;
            color: #333;
        }

        .form-group textarea {
            resize: vertical;
        }

        .form-group p {
            color: red;
            font-size: 0.9rem;
            margin-top: 0.25rem;
        }

        .text-center {
            text-align: center;
            margin-top: 1.5rem;
        }

        .text-center button {
            background-color: #007bff;
            color: white;
            padding: 0.5rem 1.5rem;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 1rem;
        }

        .text-center button:hover {
            background-color: #0056b3;
        }

        /* Success message */
        .success-message {
            color: green;
            text-align: center;
            margin-top: 1rem;
            font-size: 1rem;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar">
    <span class="navbar-brand">Admin</span>
    <a href="login.jsp" class="btn-logout">Logout</a>
</nav>

<!-- Form Container -->
<div class="centered-form">
    <div class="form-container">
        <h2>Create Software</h2>
        <form action="createSoftware" method="post">
            <div class="form-group">
                <label for="name">Software Name</label>
                <input type="text" id="name" name="name" placeholder="Enter Software Name" required>
                <p id="errorsoft"></p>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" placeholder="Enter Description" rows="3" required></textarea>
                <p id="errordesc"></p>
            </div>
            <div class="form-group">
                <label for="accessLevel">Access Level</label>
                <select id="accessLevel" name="accessLevel" required>
                    <option value="">Select Access Level</option>
                    <option value="Read">Read</option>
                    <option value="Write">Write</option>
                    <option value="Admin">Admin</option>
                </select>
            </div>
            <div class="text-center">
                <button type="submit">Create Software</button>
            </div>
            <%
                String success = (String) request.getAttribute("success");
                if (success != null) {
            %>
                <p class="success-message"><%= success %></p>
            <%
                }
            %>
        </form>
    </div>
</div>

<script type="text/javascript">
    let nameEl = document.getElementById("name");
    let descriptionEl = document.getElementById("description");

    let errorsoftEl = document.getElementById("errorsoft");
    let errordescEl = document.getElementById("errordesc");

    nameEl.addEventListener("blur", function() {
        if (nameEl.value === "") {
            errorsoftEl.textContent = "*required";
        } else {
            errorsoftEl.textContent = "";
        }
    });

    descriptionEl.addEventListener("blur", function() {
        if (descriptionEl.value === "") {
            errordescEl.textContent = "*required";
        } else {
            errordescEl.textContent = "";
        }
    });
</script>

</body>
</html>
