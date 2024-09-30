<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page import="com.example.abcwebapp.DatabaseConnection" %>
<%

    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Restaurant - Reservation</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/reservation.css">
</head>
<body>
    
    <header>
        <div class="container">
            <%@ include file="navbar.jsp" %>
        </div>
    </header>
    
     <!-- Main Content Section -->
<main>
    <div class="container hero-container">
        <img src="<%= request.getContextPath() %>/assets/images/reshero.jpg" alt="Hero Image" class="hero-img">
        <div class="hero-text">
            <h1>Reserve Our Service </h1>
            <p>Experience seamless event hosting and catering with our tailored services, delivering exceptional cuisine and flawless coordination for unforgettable occasions.</p>
            <a href="contact.jsp" class="hero-btn">Contact Us</a>
        </div>
    </div>
</main>

    <div id="paymentPopup" class="popup">
        <div class="popup-content">
            <h2>Payment Details</h2>
            <form id="paymentForm">
                <div class="form-group">
                    <label for="cardNumber">Card Number:</label>
                    <input type="text" id="cardNumber" name="cardNumber" required>
                </div>
                <div class="form-group">
                    <label for="expiryDate">Expiry Date:</label>
                    <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" required>
                </div>
                <div class="form-group">
                    <label for="cvv">CVV:</label>
                    <input type="text" id="cvv" name="cvv" required>
                </div>
                <button type="button" id="confirmPaymentBtn">Confirm Payment</button>
                <button type="button" id="cancelPaymentBtn">Cancel</button>
            </form>
        </div>
    </div>

    <main class="container">
    <section style= "background-color: #000;class="reservation-form-section">
        <div class="contact-container" style="display: flex; justify-content: center; align-items: center; padding: 40px;">
            <form id="reservationForm" action="ReservationServlet" method="POST" class="query-form" style="background-color: #000; padding: 40px; border-radius: 10px; box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1); max-width: 600px; width: 100%; text-align: center; border: 1px solid #666;">
                <h3 style="font-size: 28px; margin-bottom: 20px; font-family: Georgia, serif; color: #fff;">Reserve Your Experience</h3>
                <p style="font-size: 16px; margin-bottom: 40px; color: #aaa;">Choose your service, date, and time for a special occasion. Complete the form below to reserve your spot for free.</p>
                
                <div style="display: flex; gap: 10px; margin-bottom: 20px;">
                    <select id="serviceType" name="serviceType" required style="width: 100%; padding: 15px; background-color: #333; color: white; border-radius: 32px; border: none; font-size: 14px;">
                        <option value="Dine-In">Dine-In</option>
                        <option value="Catering">Catering</option>
                    </select>
                </div>

                <input type="date" id="reservationDate" name="reservationDate" required style="width: 100%; padding: 15px; margin-bottom: 20px; background-color: #333; color: white; border-radius: 32px; border: none; font-size: 14px;">
                
                <input type="time" id="reservationTime" name="reservationTime" required style="width: 100%; padding: 15px; margin-bottom: 20px; background-color: #333; color: white; border-radius: 32px; border: none; font-size: 14px;">

                <input type="number" id="participants" name="participants" min="1" max="100"  required style="width: 100%; padding: 15px; margin-bottom: 20px; background-color: #333; color: white; border-radius: 32px; border: none; font-size: 14px;" placeholder="Number of Participants">

                <input type="text" id="customerName" name="customerName" required style="width: 100%; padding: 15px; margin-bottom: 20px; background-color: #333; color: white; border-radius: 32px; border: none; font-size: 14px;" placeholder="Your Name">
                
                <input type="text" id="contactDetails" name="contactDetails" required style="width: 100%; padding: 15px; margin-bottom: 20px; background-color: #333; color: white; border-radius: 32px; border: none; font-size: 14px;" placeholder="Contact Details">

                <textarea id="specialRequests" name="specialRequests" rows="4" style="width: 100%; padding: 15px; background-color: #333; color: white; border-radius: 32px; border: none; font-size: 14px; margin-bottom: 20px;" placeholder="Any special requests"></textarea>
                
                <input type="hidden" id="paymentStatus" name="paymentStatus" value="Pending">

                <button type="submit" class="hero-btn"	>Reserve Now</button>
            </form>
        </div>
    </section>
</main>

    <section class="res-section">
  <div class="content-wrapper">
    <h1>PRIVATE <span>DINE-IN </span> AND <span>CATERING</span></h1>
    <p class="tagline">we are here to make your special day a truly memorable one</p>
  </div>

</section>
<!-- Why choose us -->
    <section class="about dark-theme">
        <div class="about-content">
            <h1 style= "font-size:35px;">Why Choose ABC Restaurant?</h1>
            <p>At ABC Restaurant, we provide a seamless dining experience with our exceptional cuisine, 
            tailored event hosting, and a warm, inviting atmosphere. Our chefs craft dishes using the finest ingredients, 
            ensuring every meal is a delightful culinary journey. Whether you're planning a special celebration or a casual meal, our user-friendly reservation system, attentive staff, and private dining options make ABC Restaurant the perfect choice for any occasion.</p>
            <a href="contact.jsp" class="hero-btn">Contact Us</a>
        </div>
        <div class="about-image">
            <img src="<%= request.getContextPath() %>/assets/images/whychooseus1.jpg" alt="About Image">
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


    <%
        String selectedDate = request.getParameter("reservationDate");
        String serviceType = request.getParameter("serviceType");
        boolean isEventExist = false;

        if ("Event Hosting".equals(serviceType) && selectedDate != null) {
            try {
                Connection conn = DatabaseConnection.getConnection();
                String sql = "SELECT COUNT(*) FROM reservations WHERE reservation_date = ? AND service_type = 'Host an event'";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, selectedDate);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    int count = rs.getInt(1);
                    if (count > 0) {
                        isEventExist = false;
                    }
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>

    <script>
    document.getElementById('contact-submit-btn').addEventListener('click', function(event) {
        event.preventDefault(); // Prevent form from submitting
        
        var isEventExist = '<%= isEventExist %>' === 'true';

        if (isEventExist) {
            alert('An event is already scheduled for this date. Please choose another date.');
        } else {
            // Show the payment popup
            document.getElementById('paymentPopup').style.display = 'block';
        }
    });

    document.getElementById('cancelPaymentBtn').addEventListener('click', function() {
        // Hide the payment popup
        document.getElementById('paymentPopup').style.display = 'none';
    });

    document.getElementById('confirmPaymentBtn').addEventListener('click', function() {
        var cardNumber = document.getElementById('cardNumber').value;
        var expiryDate = document.getElementById('expiryDate').value;
        var cvv = document.getElementById('cvv').value;

        if (validatePayment(cardNumber, expiryDate, cvv)) {
            document.getElementById('paymentStatus').value = "Done";

            // Hide the payment popup
            document.getElementById('paymentPopup').style.display = 'none';

            // Submit the form after payment is validated
            document.getElementById('reservationForm').submit();
        } else {
            alert('Invalid payment details.');
        }
    });

    function validatePayment(cardNumber, expiryDate, cvv) {
        var cardNumberRegex = /^\d{16}$/;
        var expiryDateRegex = /^(0[1-9]|1[0-2])\/\d{2}$/;
        var cvvRegex = /^\d{3,4}$/;

        if (!cardNumberRegex.test(cardNumber)) {
            alert('Please enter a valid 16-digit card number.');
            return false;
        }
        if (!expiryDateRegex.test(expiryDate)) {
            alert('Please enter a valid expiry date in MM/YY format.');
            return false;
        }
        if (!cvvRegex.test(cvv)) {
            alert('Please enter a valid CVV (3 or 4 digits).');
            return false;
        }
        return true;
    }
</script>


</body>
</html>