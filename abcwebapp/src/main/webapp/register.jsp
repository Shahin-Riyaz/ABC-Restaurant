<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link rel="stylesheet" href="./css/auth.css">
    <link rel="stylesheet" href="./css/style.css">
</head>
<body style="background-color: #000" >
    
    <div class= "form-main">
        <div class="form-container">
            <h2 style="color:#fff" >Register</h2>
            <form action="RegisterServlet" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <button type="submit">Register</button>
                <div class="sign-up-link">
            <p>Already have an account? <a href="login.jsp">Login</a></p>
        </div>
            </form>
        </div>
    </div>
</body>
</html>
