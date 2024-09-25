<!doctype html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Reset Password</title>
    <!-- Bootstrap CSS -->
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css' rel='stylesheet'>
</head>
<body class='bg-info'>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-8 col-lg-6 mt-5">
                <div class="container bg-white rounded mt-2 mb-2 px-0">
                    <div class="row justify-content-center align-items-center pt-3">
                        <h1><strong>Reset Password</strong></h1>
                    </div>
                    <div class="pt-3 pb-3">
                        <form id="resetForm" action="newPassword" method="POST">
                            <div class="form-group">
                                <input type="password" name="password" placeholder="New Password" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <input type="password" name="confPassword" placeholder="Confirm New Password" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Reset" class="btn btn-block btn-info">
                            </div>
                        </form>
                        <% String status = (String) request.getAttribute("status");
                           if (status != null) { %>
                            <div class="alert alert-warning" role="alert">
                                <%= status.equals("resetSuccess") ? "Password reset successfully." : 
                                    status.equals("resetFailed") ? "Failed to reset password." :
                                    status.equals("resetError") ? "An error occurred. Please try again." : 
                                    "Passwords do not match." %>
                            </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
</body>
</html>
