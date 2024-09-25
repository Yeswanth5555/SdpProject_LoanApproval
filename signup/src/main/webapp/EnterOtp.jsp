<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter OTP</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .otp-container {
            margin-top: 100px;
            padding: 40px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .otp-container h2 {
            margin-bottom: 20px;
            font-weight: 600;
        }
        .otp-container .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            font-size: 18px;
            padding: 10px 20px;
        }
        .otp-container .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 otp-container">
                <h2 class="text-center">Enter OTP</h2>
                <form method="post" action="ValidateOtp">
                    <div class="form-group">
                        <label for="otp">Enter the OTP sent to your email:</label>
                        <input type="text" class="form-control form-control-lg" id="otp" name="otp" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Submit</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            var status = "${status}";
            var message = "${message}";
            
            if (status === "failed" && message) {
                swal("Error", message, "error");
            } else if (status === "success" && message) {
                swal("Success", message, "success");
            }
        });
    </script>
</body>
</html>
