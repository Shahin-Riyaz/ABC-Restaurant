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
    <div class="container hero-container">
        <img src="<%= request.getContextPath() %>/assets/images/herobn.jpg" alt="Hero Image" class="hero-img">
        <div class="hero-text">
            <h1>Welcome to ABC Restaurant</h1>
            <p>Experience the finest culinary delights in the heart of Sri Lanka. Join us for a meal you won't forget	!</p>
            <a href="menu.jsp" class="hero-btn">Explore Our Menu</a>
        </div>
    </div>
</main>

    

    <!-- About Us Section -->
    <section class="about dark-theme">
        <div class="about-content">
            <h1 style= "font-size:38px;">About ABC Restaurant</h1>
            <br>
            <p>ABC Restaurant is a beloved dining destination where tradition meets innovation. Nestled in the heart of Sri Lanka, 
            we pride ourselves on crafting dishes that celebrate the rich culinary heritage of our culture, using the freshest ingredients
             and time-honored recipes. Whether you're enjoying a family gathering, a romantic dinner, or a casual meal with friends, our 
             warm and welcoming atmosphere makes every visit special. At ABC Restaurant, every dish is a tribute to flavor, 
            and every bite is a celebration of the art of dining. Join us, and savor the essence of true Sri Lankan hospitality.</p>
           
            <a href="contact.jsp" class="btn">Visit Us</a>
        </div>
        <div class="about-image">
            <img src="<%= request.getContextPath() %>/assets/images/about1.jpg" alt="About Image">
        </div>
    </section>
    
   <!-- Reserve Now Hero Banner -->
<div class="res" style="position: relative; width: 100%; max-height: 550px; overflow: hidden;">
    <img src="<%= request.getContextPath() %>/assets/images/res-ban.jpg" alt="About Image" style="width: 100%; height: auto; object-fit: cover;">
    <div class="banner-content" style="position: absolute; top: 50%; left: 10%; transform: translateY(-50%); color: white; max-width: 600px; justify-content: center;">
        <p class="fade-in" style="font-size: 1.2rem; letter-spacing: 2px; color: #ddab6e; margin-bottom: 10px;">Book Now</p>
        <h1 class="fade-in" style="font-size: 3rem; font-weight: bold; margin-bottom: 20px;">Reserve a Table</h1>
        <p class="fade-in" style="font-size: 1rem; line-height: 1.6; margin-bottom: 20px;">Reserve your table at ABC Restaurant for an unforgettable dining experience, featuring exquisite cuisine and exceptional service. Book now for a memorable occasion.</p>
        <a href="reservation.jsp" class="btn fade-in" style="color: #fff;">Make a Reservation</a>
    </div>
</div>

    
    <!-- Services Section -->
    <section id="services" class="service">
        <h2>Our Services</h2>
        <div class="service-items">
            <div class="service-item">
                <img src="<%= request.getContextPath() %>/assets/images/takeaway.jpg" alt="take-away" />
                <h3>Take-Away</h3>
                <p>Enjoy your favorite dishes from ABC Restaurant on the go! Our takeaway 
            	service ensures that you get the same delicious flavors.</p>
            </div>
            <div class="service-item">
                <img src="<%= request.getContextPath() %>/assets/images/delivery.jpg" alt="delivery" />
                <h3>Delivery</h3>
                <p>raving something tasty? Let ABC Restaurant bring the feast to you! 
            Our delivery service offers a wide selection of menu items.</p>
            </div>
            <div class="service-item">
                <img src="<%= request.getContextPath() %>/assets/images/catering.jpg" alt="catering" />
                <h3>Catering</h3>
                <p>Make your next event unforgettable with ABC Restaurant's catering service.
             Whether it's a corporate event, wedding, or family gathering</p>
            </div>
            <div class="service-item">
                <img src="<%= request.getContextPath() %>/assets/images/DineIn1.jpg" alt="Dine-In" />
                <h3>Dine-In</h3>
                <p>In-restaurant dining experience where guests can enjoy freshly prepared meals in a pleasant atmosphere. 
               
            	</p>
            </div>
        </div>
    </section>

  

    <!-- Footer Section -->
    <section id="testimonials" class="testimonials">
      <h2>What Our Customers Say</h2>
      <div class="testimonial">
        <img src="<%= request.getContextPath() %>/assets/images/customer1.png" alt="Customer 1" />
        <p>
          "Our favorite spot for any occasion!
           The dishes are consistently delicious, and the service is excellent. 
           Highly recommend ABC Restaurant for authentic Sri Lankan cuisine."
          
        </p>
        <h4>John Doe</h4>
      </div>
      <div class="testimonial">
        <img src="<%= request.getContextPath() %>/assets/images/customer2.png" alt="Customer 2" />
        <p>
          "ABC Restaurant offers an unforgettable dining experience! 
          The food is flavorful, the ambiance cozy, and the staff incredibly welcoming. A must-visit for anyone in Colombo."
        </p>
        <h4>Jayden Smith</h4>
      </div>
    </section>

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
