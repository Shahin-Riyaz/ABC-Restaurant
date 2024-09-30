<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.example.abcwebapp.Models.Reservation" %>
<%@ page import="com.example.abcwebapp.Models.User" %>
<%@ page import="com.example.abcwebapp.Models.Query" %>
<%@ page import="com.example.abcwebapp.DatabaseConnection" %>
<%
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        // Redirect to login page or show an error message
        response.sendRedirect("login.jsp");
        return;
    }

    List<Reservation> reservations = new ArrayList<Reservation>();
    List<Query> queries = new ArrayList<Query>();
    User user = null;
    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;

    try {
        connection = DatabaseConnection.getConnection();
        // Fetch user data
        String userSql = "SELECT * FROM users WHERE id = ?";
        statement = connection.prepareStatement(userSql);
        statement.setInt(1, userId);
        resultSet = statement.executeQuery();
        
        if (resultSet.next()) {
            user = new User();
            user.setId(resultSet.getInt("id"));
            user.setName(resultSet.getString("username"));
            user.setEmail(resultSet.getString("email"));
            // Set other user properties if needed
        }
        
        resultSet.close(); // Close the previous result set before executing the next query

        // Fetch reservations data
        String reservationsSql = "SELECT * FROM reservations WHERE user_id = ?";
        statement = connection.prepareStatement(reservationsSql);
        statement.setInt(1, userId);
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
            reservation.setStatus(resultSet.getString("status"));
            reservation.setCreatedAt(resultSet.getTimestamp("created_at"));
            reservations.add(reservation);
        }


        resultSet.close(); // Close the previous result set before executing the next query

        // Fetch user queries
        String queriesSql = "SELECT * FROM user_queries WHERE user_id = ?";
        statement = connection.prepareStatement(queriesSql);
        statement.setInt(1, userId);
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
        request.setAttribute("errorMessage", "An error occurred while retrieving reservations. Please try again later.");
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

    request.setAttribute("user", user);
    request.setAttribute("reservations", reservations);
    request.setAttribute("queries", queries); 
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="./css/customer_dashboard.css">
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <header>
        <div class="container">
            <%@ include file="navbar.jsp" %>
        </div>
    </header>

    <main >
        <section class="res-section">
  <div class="content-wrapper">
     <h1><span>Customer</span> Dashboard</span></h1>

  </div>
    </section>
        <div class="container" style="background-color:#000;">

            <div class="dashboard">
                <div class="user-queries">
                    <h2 style="color: #fff;">My Queries</h2>
                    <%
                        if (queries.isEmpty()) {
                    %>
                    <p>No queries found.</p>
                    <% 
                        } else { 
                    %>
                    <table>
                        <thead>
                            <tr>
                                <th>Issue</th>
                                <th>Date</th>
                                <th>Answer</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Query query : queries) {
                            %>
                            <tr>
                                <td><%= query.getQuery() %></td>
                                <td><%= query.getSubmissionDate() %></td>
                                <td><%= query.getAnswer() %></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                    <% 
                        } 
                    %>
                </div>

                <!-- Reservation Management Section -->
                <div class="reservation-management">
                    <h2>Reservation History</h2>
                    <%
                        if (reservations.isEmpty()) {
                    %>
                    <p>No reservations found.</p>
                    <% 
                        } else { 
                    %>
                    <table>
                        <thead>
                            <tr>
                                <th>Service Type</th>
                                <th>Date</th>
                                <th>Name</th>
                                <th>Contact Details</th>
                                <th>Notes</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Reservation reservation : reservations) {
                            %>
                            <tr>
                                <td><%= reservation.getServiceType() %></td>
                                <td><%= reservation.getReservationDate() %></td>
                                <td><%= reservation.getCustomerName() %></td>
                                <td><%= reservation.getContactDetails() %></td>
                                <td><%= reservation.getSpecialRequests() %></td>
                                <td><%= reservation.getStatus() %></td>
                                <td>
                                    <form action="CancelReservationServlet" method="post" style="display:inline;">
                                        <input type="hidden" name="reservationId" value="<%= reservation.getId() %>">
                                        <button type="submit" onclick="return confirm('Are you sure you want to cancel this reservation?');">Cancel</button>
                                    </form>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                    <% 
                        } 
                    %>
                </div>

                <!-- Profile Management Section -->
                <div class="profile-management" style="display: flex; justify-content: center; align-items: center; background-color: #000; padding: 50px;">
    <form action="UpdateProfileServlet" method="post" style="background-color: #000; padding: 40px; border-radius: 10px; box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1); max-width: 600px; width: 100%; text-align: center; border: 1px solid #666;">
        <h3 style="font-size: 28px; margin-bottom: 20px; color: #fff;">Update Your Profile Details</h3>

        <div style="display: flex; gap: 10px; margin-bottom: 20px;">
            <input type="text" id="name" name="name" value="<%= user != null ? user.getName() : "" %>" placeholder="Name" required style="width: 100%; padding: 15px; background-color: #333; color: white; border-radius: 32px; border: none; font-size: 14px;">
        </div>

        <input type="email" id="email" name="email" value="<%= user != null ? user.getEmail() : "" %>" placeholder="Email" required style="width: 100%; padding: 15px; margin-bottom: 20px; background-color: #333; color: white; border-radius: 32px; border: none; font-size: 14px;">

        <button type="submit" class="hero-btn">Update</button>
    </form>
</div>

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
