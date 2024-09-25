<%@ page session="true" %>
<%
    // Check if user is logged in
    if (session.getAttribute("name") == null) {
        response.sendRedirect("login.jsp");
        return; // Stop further processing
    }

    String name = (String) session.getAttribute("name");
    String email = (String) session.getAttribute("email");
    String contact = (String) session.getAttribute("contact");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Update Profile</title>
</head>
<body>
    <h1>Update Profile</h1>
    <form action="ProfileUpdateServlet" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= name %>" required /><br/>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= email %>" required /><br/>

        <label for="contact">Contact Number:</label>
        <input type="text" id="contact" name="contact" value="<%= contact %>" required /><br/>

        <input type="submit" value="Update Profile" />
    </form>
    
    <%
    // Check for success message
    String updateSuccess = request.getParameter("updateSuccess");
    if ("true".equals(updateSuccess)) {
        out.println("<p>Profile updated successfully!</p>");
    }
    %>
</body>
</html>