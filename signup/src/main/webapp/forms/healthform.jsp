
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Health Loan Application</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        /* General Styles */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 60%;
            margin: 40px auto;
            padding: 30px;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-weight: 500;
            color: #34495e;
        }

        input, select, textarea {
            padding: 12px;
            border: 2px solid #dfe6e9;
            border-radius: 10px;
            font-size: 16px;
            transition: all 0.3s ease;
            background-color: #f8f9fa;
        }

        input:focus, select:focus, textarea:focus {
            border-color: #27ae60;
            outline: none;
            box-shadow: 0 5px 15px rgba(39, 174, 96, 0.2);
        }

        textarea {
            resize: none;
        }

        .two-columns {
            display: flex;
            gap: 10px;
        }

        .two-columns input {
            width: 100%;
        }

        /* Submit Button Styling */
        .submit-btn {
            background-color: #27ae60;
            color: white;
            padding: 14px;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            font-size: 18px;
            font-weight: 600;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #219150;
            box-shadow: 0 8px 20px rgba(39, 174, 96, 0.3);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                width: 90%;
            }

            .two-columns {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Apply for a Health Loan</h2>
        <form action="#" method="POST">
            
            <!-- Full Name -->
            <label for="fullName">Full Name*</label>
            <div class="two-columns">
                <input type="text" id="firstName" name="firstName" placeholder="First Name" required>
                <input type="text" id="lastName" name="lastName" placeholder="Last Name" required>
            </div>
            
            <!-- Email -->
            <label for="email">E-mail*</label>
            <input type="email" id="email" name="email" placeholder="example@example.com" required>
            
            <!-- Phone Number -->
            <label for="phone">Phone Number*</label>
            <input type="tel" id="phone" name="phone" placeholder="(000) 000-0000" pattern="^\(\d{3}\) \d{3}-\d{4}$" required>
            
            <!-- Address -->
            <label for="address">Address*</label>
            <input type="text" id="streetAddress" name="streetAddress" placeholder="Street Address" required>
            <input type="text" id="streetAddress2" name="streetAddress2" placeholder="Street Address Line 2">
            <div class="two-columns">
                <input type="text" id="city" name="city" placeholder="City" required>
                <input type="text" id="state" name="state" placeholder="State / Province" required>
            </div>
            <input type="text" id="zipCode" name="zipCode" placeholder="Postal / Zip Code" required>
            
            <!-- Loan Amount -->
            <label for="loanAmount">Requested Loan Amount*</label>
            <input type="number" id="loanAmount" name="loanAmount" placeholder="Enter the amount" required>

            <!-- Purpose of the Loan -->
            <label for="loanPurpose">Purpose of the Loan*</label>
            <select id="loanPurpose" name="loanPurpose" required>
                <option value="" disabled selected>Please Select</option>
                <option value="medical">Medical Expenses</option>
                <option value="surgery">Surgery</option>
                <option value="therapy">Therapy/Treatment</option>
                <option value="other">Other</option>
            </select>
            
            <!-- Insurance Coverage -->
            <label for="insuranceCoverage">Do you have health insurance coverage?*</label>
            <select id="insuranceCoverage" name="insuranceCoverage" required>
                <option value="" disabled selected>Please Select</option>
                <option value="yes">Yes</option>
                <option value="no">No</option>
            </select>
            
            <!-- Pre-qualification status -->
            <label for="preQualified">Are you pre-qualified for a loan?*</label>
            <select id="preQualified" name="preQualified" required>
                <option value="" disabled selected>Please Select</option>
                <option value="yes">Yes</option>
                <option value="no">No</option>
            </select>
            
            <!-- Comments or questions -->
            <label for="comments">Comments or questions:</label>
            <textarea id="comments" name="comments" rows="4" maxlength="300" placeholder="0/300"></textarea>
            
            <!-- Submit Button -->
            <button type="submit" class="submit-btn">Submit</button>
        </form>
    </div>

</body>
</html>
