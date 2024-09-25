<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">

    <!-- SweetAlert CSS -->
    <link rel="stylesheet" href="https://unpkg.com/sweetalert/dist/sweetalert.css">

    <style>
        body, html {
            height: 90%;
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .main {
            display: flex;
            height: 80vh;
            max-width: 1300px;
            border-radius: 20px;
            overflow: hidden;
        }

        .sign-in {
            display: flex;
            height: 80vh;
            max-width: 1300px;
            border-radius: 20px;
            overflow: hidden;
        }

        .sign-in img {
            width: 90%;
            height: auto;
            object-fit: cover;
            border-radius: 40px 0 0 40px;
            filter: brightness(0.9);
        }

        .signin-content {
            display: flex;
            flex-direction: column;
            width: 50%;
            background: rgba(255, 255, 255, 0.5); /* Add transparency */
            border-radius: 0 10px 10px 0;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            padding: 60px;
            box-sizing: border-box;
            justify-content: center;
        }

        .signin-form {
            width: 70%;
        }

        .form-title {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group input {
            width: 100%;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-group label {
            margin-right: 10px;
        }

        .form-group a {
            color: #007bff;
            text-decoration: none;
            display: block;
            text-align: center;
        }

        .form-group a:hover {
            text-decoration: underline;
        }

        .form-submit {
            width: 100%;
            padding: 15px;
            border: none;
            background: #007bff;
            color: #fff;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .form-submit:hover {
            background: #0056b3;
        }

        .social-login {
            text-align: center;
            margin-top: 50px;
        }

        .socials {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .socials li {
            display: inline;
            margin: 0 10px;
        }

        .socials a {
            color: #333;
            font-size: 24px;
            transition: color 0.3s ease;
        }

        .socials a:hover {
            color: #007bff;
        }

        .error-message, .success-message {
            font-size: 14px;
            text-align: center;
            margin-top: 10px;
        }

        .error-message {
            color: #dc3545;
        }

        .success-message {
            color: #28a745;
        }

        .signup-image-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #007bff;
            text-decoration: none;
        }

        .signup-image-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<input type="hidden" id="status" value="${status}">
<input type="hidden" id="error" value="${error}">

<div class="main">
    <section class="sign-in">
        <figure>
            <img src="images/sign-in.jpeg" alt="sign in image">
        </figure>
        <div class="signin-content">
            <div class="signin-form">
                <h2 class="form-title">Sign in</h2>
                <form method="post" action="login" class="register-form" id="login-form">
                    <div class="form-group">
                        <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
                        <input type="text" name="username" id="username" placeholder="Your Email" required />
                    </div>
                    <div class="form-group">
                        <label for="password"><i class="zmdi zmdi-lock"></i></label>
                        <input type="password" name="password" id="password" placeholder="Password" required />
                    </div>
                    <div class="form-group">
                        <a href="forgotPassword.jsp">Forgot Password?</a>
                        <a href="registration.jsp" class="signup-image-link">Create an account</a>
                    </div>
                    <div class="form-group form-button">
                        <input type="submit" name="signin" id="signin" class="form-submit" value="Log in" />
                    </div>
                </form>
                <div class="social-login">
                    <span class="social-label">Or login with</span>
                    <ul class="socials">
                        <li><a href="https://www.facebook.com/"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                        <li><a href="https://accounts.google.com/"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
</div>

<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    const status = document.getElementById('status') ? document.getElementById('status').value.trim() : '';
    const error = document.getElementById('error') ? document.getElementById('error').value.trim() : '';

    function showAlert(title, text, type) {
        swal(title, text, type);
    }

    if (status === 'result-sucess'){
    	showAlert('Success', 'Password has been reset successfully!', 'success');
    }
    else if (status === 'success') {
        showAlert('Success', 'Password has been reset successfully!', 'success');
    } else if (status === 'failed') {
        showAlert('Error', 'Login failed. Please check your email and password.', 'error');
    } else if (error) {
        showAlert('Error', error, 'error');
    }
});
</script>
</body>
</html>
