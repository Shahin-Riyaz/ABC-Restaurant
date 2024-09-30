	<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <nav class="navbar">
            <div class="logo">
                <a href="index.jsp">
                    <img src="<%= request.getContextPath() %>/assets/images/abcrestaurant1.png" alt="Logo">
                </a>
            </div>
            <ul class="nav-links">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="index.jsp#services">Services</a></li>
                <li><a href="menu.jsp">Menu</a></li>
                <li><a href="menu.jsp#gallery">Gallery</a></li>
       
                <% if (session != null && session.getAttribute("userId") != null) {
                    if ("staff".equals(session.getAttribute("userRole"))) { %>
                        <li><a href="staff_dashboard.jsp">Staff Dashboard</a></li>
                    <% } else if ("admin".equals(session.getAttribute("userRole"))) { %>
                        <li><a href="admin_dashboard.jsp">Admin Dashboard</a></li>
                    <% } else { %>    
                        <li><a href="reservation.jsp">Reservation</a></li>
                        <li><a href="contact.jsp">Contact</a></li>
                        <li><a href="customer_dashboard.jsp">Profile</a></li>
                    <% } %> 
                    <li class="btn"><a href="logout.jsp">Logout</a></li>
                <% } else { %>
                    <div class="btn-align">
                    <li class="btn"><a href="register.jsp" style="color: #fff;">Register</a></li>
                    <li class="btn"><a href="login.jsp"style="color: #fff;">Login</a></li>
                    </div>
                    
                <% } %>                
            </ul>
            <div class="menu-toggle">
                <i class="fas fa-bars"></i>
            </div>
        </nav>
    </header>


    
</body>
</html>
