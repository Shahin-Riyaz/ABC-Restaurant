<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Restaurant - Services</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/services.css">
</head>
<body>

    <!-- Header Section -->
    <header class="header">
        <div class="container">
            <%@ include file="navbar.jsp" %>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <div class="hero-content">
                <h1>Discover Our Exceptional Services</h1>
                <p>Experience culinary excellence with our variety of dining options and special facilities.</p>
            </div>
        </div>
    </section>

    <!-- Main Content -->
    <main class="container">
        <section id="services" class="service-types">
            <div class="service-grid">
                <div class="service-item">
                    <div class="service-image take-out">
                        <img src="<%= request.getContextPath() %>/assets/images/takeaway.jpg" alt="Take-Away">
                    </div>
                    <h3>Take-Away</h3>
                </div>
                <div class="service-item">
                    <div class="service-image delivery">
                        <img src="<%= request.getContextPath() %>/assets/images/delivery.jpg" alt="Delivery">
                    </div>
                    <h3>Delivery</h3>
                </div>
                <div class="service-item">
                    <div class="service-image catering">
                        <img src="<%= request.getContextPath() %>/assets/images/catering.jpg" alt="Catering">
                    </div>
                    <h3>Catering</h3>
                </div>
            </div>
        </section>

        <section class="special-facilities">
            <div class="facility-grid">
                <div class="facility-item">
                    <div class="facility-image private-dining">
                        <img src="<%= request.getContextPath() %>/assets/images/cheftable.jpeg" alt="Chef's Table">
                    </div>
                    <h3>Chef's Table</h3>
                    <p>An Exclusive Culinary Experience Indulge in a unique dining adventure at our Chef’s Table, where gastronomy meets artistry. Situated in an intimate setting near our open kitchen, the Chef’s Table offers you a front-row seat to the culinary action. Watch as our expert chefs craft exquisite dishes just for you, using the finest ingredients and techniques. This personalized dining experience includes a specially curated menu, interactive sessions with the chef, and the opportunity to learn the stories behind each course. Perfect for food enthusiasts and special occasions, the Chef’s Table promises an unforgettable meal that delights all the senses.</p>
                </div>
                <div class="facility-item">
                    <div class="facility-image event-hosting">
                        <img src="<%= request.getContextPath() %>/assets/images/drivethru.webp" alt="Drive-Thru">
                    </div>
                    <h3>Drive-Thru</h3>
                    <p>Convenience at Your Fingertips Experience the ultimate convenience with our Drive-Thru service, designed for those on the go. Whether you're in a rush or simply prefer the comfort of your car, our Drive-Thru allows you to enjoy your favorite meals without leaving your vehicle. Place your order, and we'll have it freshly prepared and ready for you in no time. Perfect for busy days, quick lunches, or a hassle-free dining experience, our Drive-Thru ensures you get the delicious food you love, fast and easy.</p>
                </div>
            </div>
        </section>
    </main>
</body>
</html>
