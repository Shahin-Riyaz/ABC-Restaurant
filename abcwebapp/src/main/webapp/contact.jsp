<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Query</title>
    <link rel="stylesheet" href="./css/contact.css">
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <!-- Header Section -->
    <header>
        <%@ include file="navbar.jsp" %>
    </header>
    
    <main>
        <div class="hero-container">
            <img src="<%= request.getContextPath() %>/assets/images/contactus-hero.jpeg" alt="Hero Image" class="hero-img">
            <div class="hero-text">
                <h1>Contact Us</h1>
                <p>Ensuring a smooth and effortless experience, we make it easy for you to get in touch with us. From reservations to inquiries, we're here to assist you every step of the way!</p>
                <a href="reservation.jsp" class="hero-btn">Reserve Now</a>
            </div>
        </div>
    </main>
         
    <div class="contact-container" style="display: flex; justify-content: center; align-items: center; background-color: #000; padding: 50px;">
        <form action="QueryServlet" method="post" class="query-form" style="background-color: #000; padding: 40px; border-radius: 10px; box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1); max-width: 600px; width: 100%; text-align: center; border: 1px solid #666;">
            <h3 style="font-size: 28px; margin-bottom: 20px; font-family: Georgia, serif; color: #fff;">Get in Touch with Us</h3>
            <p style="font-size: 16px; margin-bottom: 40px; color: #aaa;">Whether you have a question, want to make a reservation, or just share your thoughts, we are here to hear from you. Fill out the form and we will get back soon.</p>

            <div style="display: flex; gap: 10px; margin-bottom: 20px;">
                <input type="text" id="name" name="name" placeholder="Name" required style="width: 100%; padding: 15px; background-color: #333; color: white; border-radius: 32px; border: none; font-size: 14px;">
            </div>

            <input type="email" id="email" name="email" placeholder="Email" required style="width: 100%; padding: 15px; margin-bottom: 20px; background-color: #333; color: white; border-radius: 32px; border: none; font-size: 14px;">
            
            <textarea id="query" name="query" placeholder="Message" rows="5" required style="width: 100%; padding: 15px; background-color: #333; color: white; border-radius: 32px; border: none; font-size: 14px; margin-bottom: 20px;"></textarea>
            
            <button type="submit" class="contact-submit-btn" style="background-color: #; border: none; padding: 15px 0; color: white; font-size: 16px; font-weight: bold; cursor: pointer; width: 100%; text-transform: uppercase; border-radius: 32px;">Send</button>
        </form>
    </div>
<!---Reserve Now Hero Banner-->
<div class="res" style="position: relative; width: 100%; max-height: 550px; overflow: hidden;">
    <img src="<%= request.getContextPath() %>/assets/images/res-ban2.jpg" alt="About Image" style="width: 100%; height: auto; object-fit: cover;">
    <div class="res-content" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: white; text-align: center; max-width: 600px;">
        <p style="font-size: 1.2rem; letter-spacing: 2px; color: #ddab6e; margin-bottom: 10px;">Visit Us</p>
        <h1 style="font-size: 3rem; font-weight: bold; margin-bottom: 20px;">Experience Pure Elegance</h1>
        <p style="font-size: 1rem; line-height: 1.6; margin-bottom: 20px;">Reserve your table at ABC Restaurant for an unforgettable dining experience, featuring exquisite cuisine and exceptional service. Book now for a memorable occasion.</p>
        <a href="reservation.jsp" class="btn" style="color:#fff;">Book Now</a>
    </div>
</div>



    <div style="display: flex; justify-content: space-between; background-color: #000000; color: #ffffff; padding: 150px; max-width: 1300px; margin: 0 auto; border-radius: 10px; font-family: 'Roboto', system-ui;">
        
        <!-- Contact Info Section -->
        <div style="width: 46%; border-right: 2px solid #ffffff;">
            <h3 style="color: #864d25; font-size: 1rem; text-transform: uppercase; letter-spacing: 2px; margin-bottom: 10px;">Contact Info</h3>
            <h1 style="font-size: 2.5rem;margin-top: 14px; margin-bottom: 30px;">For More Information</h1>
            
            <div style="margin-bottom: 20px;">
                <p style="color: #864d25; font-size: 1.2rem; font-weight: bold;">Our Location</p>
                <p>17/1 De Fonseka Rd, Colombo 00500</p>
            </div>
            
            <div style="margin-bottom: 20px;">
                <p style="color: #864d25; font-size: 1.2rem; font-weight: bold;">Our Phone</p>
                <p>+011 1919-1414-896 | +011 1919-1414-897</p>
            </div>
            
            <div>
                <p style="color: #864d25; font-size: 1.2rem; font-weight: bold;">Our Email</p>
                <p>abcrestaurant@contact.com | abcrestaurant@support.com</p>
            </div>
        </div>

        <!-- Opening Hours Section -->
        <div style="width: 46%; padding-left: 20px;">
            <h3 style="color: #864d25; font-size: 1rem; text-transform: uppercase; letter-spacing: 2px; margin-bottom: 10px;">Opening Hours</h3>
            <h1 style="font-size: 2.5rem; margin-bottom: 10px;">Visit Us</h1>

            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
                <p>Monday</p>
                <div style="flex-grow: 1; height: 1px; border-bottom: 1px dotted #ffffff; margin: 0 10px;"></div>
                <p>09:00 - 19:00</p>
            </div>
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
                <p>Tuesday</p>
                <div style="flex-grow: 1; height: 1px; border-bottom: 1px dotted #ffffff; margin: 0 10px;"></div>
                <p>10:00 - 20:00</p>
            </div>
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
                <p>Wednesday</p>
                <div style="flex-grow: 1; height: 1px; border-bottom: 1px dotted #ffffff; margin: 0 10px;"></div>
                <p>11:00 - 20:00</p>
            </div>
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
                <p>Thursday</p>
                <div style="flex-grow: 1; height: 1px; border-bottom: 1px dotted #ffffff; margin: 0 10px;"></div>
                <p>11:00 - 21:00</p>
            </div>
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
                <p>Friday</p>
                <div style="flex-grow: 1; height: 1px; border-bottom: 1px dotted #ffffff; margin: 0 10px;"></div>
                <p>13:00 - 21:00</p>
            </div>
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
                <p>Saturday</p>
                <div style="flex-grow: 1; height: 1px; border-bottom: 1px dotted #ffffff; margin: 0 10px;"></div>
                <p>13:00 - 21:00</p>
            </div>
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
                <p>Sunday</p>
                <div style="flex-grow: 1; height: 1px; border-bottom: 1px dotted #ffffff; margin: 0 10px;"></div>
                <p>13:00 - 21:00</p>
            </div>
        </div>
    </div>
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
