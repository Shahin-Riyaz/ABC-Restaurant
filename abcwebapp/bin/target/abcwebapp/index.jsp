<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Restaurant - Home</title>
    <link rel="stylesheet" href="./css/style.css">
</head>

<body>
    <!-- Header Section -->
    <header>
        <div class="container">
            <%@ include file="navbar.jsp" %>
        </div>
    </header>

    <!-- Main Content Section -->
    <main>
        <div class="container">
            <img src="<%= request.getContextPath() %>/assets/images/hero.png" alt="Logo" class="hero-img">
            <div class="hero-text">Where Every Bite is a Celebration...</div>
        </div>
    </main>
</body>

</html>
