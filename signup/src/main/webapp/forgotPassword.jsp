<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    
    <!-- Bootstrap CDN -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            background: linear-gradient(135deg, #f2f4f7 0%, #dfe7f2 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
        }

        .container {
            margin-top: 100px;
        }

        .forgot {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .forgot h2 {
            font-size: 28px;
            font-weight: 700;
            color: #007bff;
            margin-bottom: 25px;
            text-align: center;
        }

        .forgot p {
            font-size: 16px;
            margin-bottom: 20px;
            text-align: center;
        }

        .forgot ol {
            padding-left: 0;
            text-align: center;
            list-style-type: none;
        }

        .forgot li {
            margin-bottom: 10px;
            font-size: 16px;
        }

        .forgot .text-primary {
            font-weight: 600;
        }

        .form-control {
            font-size: 16px;
            padding: 10px;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .btn {
            font-size: 16px;
            padding: 10px 30px;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .btn-success:hover {
            background-color: #218838;
            box-shadow: 0 4px 8px rgba(40, 167, 69, 0.4);
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .btn-danger:hover {
            background-color: #c82333;
            box-shadow: 0 4px 8px rgba(220, 53, 69, 0.4);
        }

        .card-footer {
            background-color: transparent;
            border-top: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8">
                <div class="forgot">
                    <h2>Forgot Your Password?</h2>
                    <p>Change your password in three easy steps to secure your account!</p>
                    <ol>
                        <li><span class="text-primary">1.</span> Enter your email address below.</li>
                        <li><span class="text-primary">2.</span> We'll send you an OTP to your email.</li>
                        <li><span class="text-primary">3.</span> Enter the OTP to reset your password.</li>
                    </ol>
                </div>
                <form class="card mt-4 forgot" action="forgotPassword" method="POST">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="email-for-pass">Enter Your Email Address</label>
                            <input class="form-control" type="email" name="email" id="email-for-pass" placeholder="example@example.com" required>
                            <small class="form-text text-muted">Enter your registered email address. We'll send an OTP to this email.</small>
                        </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between">
                        <button class="btn btn-success" type="submit">Get New Password</button>
                        <a href="login.jsp" class="btn btn-danger">Back to Login</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
