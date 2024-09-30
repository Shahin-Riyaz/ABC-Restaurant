<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.abcwebapp.DatabaseConnection" %>
<%@ page import="com.example.abcwebapp.Models.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Restaurant - Menu</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/menu.css">
  
</head>
<body>

    <!-- Header Section -->
    <header>
        <div class="container">
            <%@ include file="navbar.jsp" %>
        </div>
    </header>
     <main>
   <div>
   <div>
   <div class="hero-container" style="position: relative; text-align: center; color: white;">
    <img src="<%= request.getContextPath() %>/assets/images/menu-res.jpg" alt="Hero Image" class="hero-img" style="width: 100%; height: auto; display: block;">
    <div class="hero-text" >
        <h1>Our Menu</h1>
        <p>
            Delight in an unforgettable culinary journey with our exquisite menu, crafted to satisfy every palate. 
            Experience the perfect ambiance and savor each bite in our elegant dining setting. 
        </p>
        <a href="reservation.jsp" class="hero-btn" >Reserve Now</a>
    </div>
</div>

    </div>
    
</main>
    <!-- Main Content -->
    <main class="container">
        <h1 class="menu-title">Our Signature Dishes</h1>
        <div class="menu-grid">
            <%
                List<Product> products = new ArrayList<Product>();
                Connection connection = null;
                PreparedStatement statement = null;
                ResultSet resultSet = null;

                try {
                    connection = DatabaseConnection.getConnection();
                    String query = "SELECT * FROM products";
                    statement = connection.prepareStatement(query);
                    resultSet = statement.executeQuery();

                    while (resultSet.next()) {
                        Product product = new Product();
                        product.setId(resultSet.getInt("id"));
                        product.setName(resultSet.getString("name"));
                        product.setDescription(resultSet.getString("description"));
                        product.setPrice(resultSet.getDouble("price"));
                        product.setImageUrl(resultSet.getString("image_url"));
                        products.add(product);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (resultSet != null) resultSet.close();
                        if (statement != null) statement.close();
                        if (connection != null) connection.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }

                if (!products.isEmpty()) {
                    for (Product product : products) {
            %>
                <div class="menu-item">
                    <div class="menu-item-image">
                        <img src="<%= request.getContextPath() %>/assets/<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
                    </div>
                    <div class="content">
                        <h3><%= product.getName() %></h3>
                   
                        <p class="price">$<%= product.getPrice() %></p>
                    </div>
                </div>
            <%
                    }
                } else {
            %>
                <p>No products available.</p>
            <%
                }
            %>
        </div>
          <!-- Menu Section -->
   <section id="gallery" class="gallery">
      <h2>Gallery</h2>
      <div class="image-grid">
        <div class="image-item">
          <img src="<%= request.getContextPath() %>/assets/images/gallery01.jpg" alt="Image 1" />
        </div>
        <div class="image-item">
          <img src="<%= request.getContextPath() %>/assets/images/gallery02.jpg" alt="Image 2" />
        </div>
        <div class="image-item">
          <img src="<%= request.getContextPath() %>/assets/images/gallery03.jpg" alt="Image 3" />
        </div>
        <div class="image-item">
          <img src="<%= request.getContextPath() %>/assets/images/gallery04.jpg" alt="Image 4" />
        </div>
           <div class="image-item">
          <img src="<%= request.getContextPath() %>/assets/images/gallery05.jpg" alt="Image 5" />
        </div>
        <div class="image-item">
          <img src="<%= request.getContextPath() %>/assets/images/gallery06.jpg" alt="Image 6" />
        </div>
        <div class="image-item">
          <img src="<%= request.getContextPath() %>/assets/images/gallery07.jpg" alt="Image 7" />
        </div>
        <div class="image-item">
          <img src="<%= request.getContextPath() %>/assets/images/gallery08.jpg" alt="Image 8" />
        </div>
      </div>
    </main>

    <!-- Footer Section -->
    <footer class="footer">
        <div class="footer-content">
            <div class="footer-logo">
                <img src="<%= request.getContextPath() %>/assets/images/iconlogo.png" alt="Logo">
            </div>
            <nav class="footer-links">
                <a href="#">Home</a>
                <a href="index.jsp#services">Services</a>
                <a href="index.jsp#menu">Menu</a>
                <a href="index.jsp#gallery">Gallery</a>
                <a href="index.jsp#testimonials">Testimonial</a>
            </nav>
        </div>
        <p class="footer-text">&copy; ABC Restaurant 2024. All rights reserved.</p>
    </footer>
</body>
</html>