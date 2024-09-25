<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">

    <!-- SweetAlert2 CSS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- Custom Styles -->
    <style>
        body {
            font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif;
        }

        .btn-primary {
            background-color: #3085d6;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-primary:hover {
            background-color: #256ba5;
        }
    </style>
</head>
<body>

<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

<div class="main">

    <!-- Sign up form -->
    <section class="signup">
        <div class="container">
            <div class="signup-content">
                <div class="signup-form">
                    <h2 class="form-title">Sign up</h2>
                    
                    <form method="post" action="register" class="register-form" id="register-form">
                        <div class="form-group">
                            <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="text" name="name" id="name" placeholder="Full Name" required />
                        </div>
                        <div class="form-group">
                            <label for="email"><i class="zmdi zmdi-email"></i></label>
                            <input type="email" name="email" id="email" placeholder="Your Email" required />
                        </div>
                        <div class="form-group">
                            <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="pass" id="pass" placeholder="Password" required />
                        </div>
                        <div class="form-group">
                            <label for="re_pass"><i class="zmdi zmdi-lock-outline"></i></label>
                            <input type="password" name="re_pass" id="re_pass" placeholder="Re-Enter password" required />
                        </div>
                        <div class="form-group">
                            <label for="contact"><i class="zmdi zmdi-phone"></i></label>
                            <input type="text" name="contact" id="contact" placeholder="Contact no" required />
                        </div>
                        <div class="form-group">
                            <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                            <label for="agree-term" class="label-agree-term">
                                <span><span></span></span>I agree to all statements in <a href="#" class="term-service">Terms of service</a>
                            </label>
                        </div>
                        <div class="form-group form-button">
                            <input type="submit" name="signup" id="signup" class="form-submit btn-primary" value="Register" />
                        </div>
                    </form>
                </div>
                <div class="signup-image">
                    <figure>
                        <img src="images/sign-up.jpg" alt="sign up image">
                    </figure>
                    <a href="login.jsp" class="signup-image-link">I am already a member</a>
                </div>
            </div>
        </div>
    </section>

</div>
<script>
document.getElementById('register-form').addEventListener('submit', function(event) {
    event.preventDefault();

    const contact = document.getElementById('contact').value;
    const pass = document.getElementById('pass').value;
    const re_pass = document.getElementById('re_pass').value;

    if (contact.length !== 10) {
        Swal.fire('Error', 'Mobile number must be 10 digits', 'error');
        return;
    }

    if (pass !== re_pass) {
        Swal.fire('Error', 'Passwords do not match', 'error');
        return;
    }

    // If validation passes, you can show a success message or submit the form
    Swal.fire('Success', 'Registration successful!', 'success').then(() => {
        this.submit(); // Submit the form after the alert
    });
});
</script>


</body>
</html>
