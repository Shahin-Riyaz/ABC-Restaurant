<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.example.abcwebapp.Models.Reservation" %>
<%@ page import="com.example.abcwebapp.Models.Query" %>
<%@ page import="com.example.abcwebapp.DatabaseConnection" %>
<%
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Reservation> reservations = new ArrayList<Reservation>();
    List<Query> queries = new ArrayList<Query>();
    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;

    try {
        connection = DatabaseConnection.getConnection();

        // Fetch reservations data
        String reservationsSql = "SELECT * FROM reservations";
        statement = connection.prepareStatement(reservationsSql);
        resultSet = statement.executeQuery();

        while (resultSet.next()) {
            Reservation reservation = new Reservation();
            reservation.setId(resultSet.getInt("id"));
            reservation.setUserId(resultSet.getInt("user_id"));
            reservation.setServiceType(resultSet.getString("service_type"));
            reservation.setReservationDate(resultSet.getDate("reservation_date"));
            reservation.setCustomerName(resultSet.getString("customer_name"));
            reservation.setContactDetails(resultSet.getString("contact_details"));
            reservation.setSpecialRequests(resultSet.getString("special_requests"));
            reservation.setPaymentStatus(resultSet.getString("payment_status"));
            reservation.setStatus(resultSet.getString("status"));
            reservation.setCreatedAt(resultSet.getTimestamp("created_at"));
            reservations.add(reservation);
        }

        resultSet.close(); // Close the previous result set before executing the next query

        // Fetch user queries
        String queriesSql = "SELECT * FROM user_queries";
        statement = connection.prepareStatement(queriesSql);
        resultSet = statement.executeQuery();

        while (resultSet.next()) {
            Query query = new Query();
            query.setId(resultSet.getInt("id"));
            query.setUserId(resultSet.getInt("user_id"));
            query.setName(resultSet.getString("name"));
            query.setEmail(resultSet.getString("email"));
            query.setQuery(resultSet.getString("query"));
            query.setSubmissionDate(resultSet.getDate("submission_date"));
            query.setAnswer(resultSet.getString("answer"));
            queries.add(query);
        }

    } catch (SQLException e) {
        e.printStackTrace();  // Consider logging this instead of printing stack trace in production
        request.setAttribute("errorMessage", "An error occurred while retrieving data. Please try again later.");
    } finally {
        // Close resources in reverse order of their creation
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    request.setAttribute("reservations", reservations);
    request.setAttribute("queries", queries);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/admin_dashboard.css">
</head>
<body style="background-color: #000;">
    <header>
        <%@ include file="navbar.jsp" %>
    </header>

    <main>
    <section class="res-section">
  <div class="content-wrapper">
     <h1 style="color: #fff;"><span>Admin</span> Dashboard</span></h1>

  </div>
    </section>
        <div class="container" ">
    <section class="add-staff-member-section" style="display: flex; justify-content: center; align-items: center; padding: 55px;">
        <form action="AddStaffServlet" method="post" style="background-color: #000; padding: 40px; border-radius: 10px; box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1); max-width: 600px; width: 100%; text-align: center; border: 1px solid #666;">
            <h3 style="font-size: 28px; margin-bottom: 20px; color: #fff;">Add Staff Member</h3>

            <div style="margin-bottom: 20px;">
                <label for="name" style="color: #fff; display: block; margin-bottom: 5px;">Name:</label>
                <input type="text" id="name" name="name" required placeholder="Enter name" style="width: 100%; padding: 15px; background-color: #333; color: white; border-radius: 32px; border: none; font-size: 14px;">
            </div>

            <div style="margin-bottom: 20px;">
                <label for="email" style="color: #fff; display: block; margin-bottom: 5px;">Email:</label>
                <input type="email" id="email" name="email" required placeholder="Enter email" style="width: 100%; padding: 15px; background-color: #333; color: white; border-radius: 32px; border: none; font-size: 14px;">
            </div>

            <div style="margin-bottom: 20px;">	
                <label for="role" style="color: #fff; display: block; margin-bottom: 5px;">Role:</label>
                <select id="role" name="role" style="width: 100%; padding: 15px; background-color: #333; color: white; border-radius: 32px; border: none; font-size: 14px;">
                    <option value="staff" selected>Staff</option>
                    <option value="admin">Admin</option>
                </select>
            </div>

            <div style="margin-bottom: 20px;">
                <label for="password" style="color: #fff; display: block; margin-bottom: 5px;">Password:</label>
                <input type="password" id="password" name="password" required placeholder="Enter password" style="width: 100%; padding: 15px; background-color: #333; color: white; border-radius: 32px; border: none; font-size: 14px;">
            </div>

            <button type="submit" class="hero-btn" >
                Add
            </button>
        </form>
    </section>
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
