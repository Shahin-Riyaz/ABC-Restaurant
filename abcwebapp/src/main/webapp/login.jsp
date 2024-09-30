<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <link rel="stylesheet" href="./css/auth.css">
    <link rel="stylesheet" href="./css/style.css">
</head>
<body style="background-color: #000">

    <div class= "form-main">
    
        <div class="form-container">
            <h2 style="color:#fff;">LOGIN</h2>
            <form action="LoginServlet" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                
                <div class="forgot">
            <section>
                <input type="checkbox" id="check">
                <label for="check">Remember me</label>
            </section>
            </div>

                <button type="submit">Login</button>
                <div class="sign-up-link">
            <p>Don't have an account? <a href="register.jsp">Register</a></p>
        </div>
            </form>
        </div>
    </div>
</body>
</html>
