
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loan Application Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-title {
            text-align: center;
            margin-bottom: 30px;
            color: #007bff;
        }
        .section-title {
            margin-top: 20px;
            margin-bottom: 10px;
            color: #007bff;
            font-weight: bold;
        }
        .form-check-label {
            margin-left: 5px;
        }
    </style>
</head>
<body>

    <div class="container form-container">
        <h2 class="form-title">Loan Application Form</h2>
        <form action="submit-loan-application" method="POST">
            <!-- Desired Loan Amount -->
            <div class="mb-3">
                <label for="loanAmount" class="form-label">Desired Loan Amount </label>
                <input type="number" class="form-control" id="loanAmount" name="loanAmount" placeholder="0" required>
            </div>

            <!-- Annual Income -->
            <div class="mb-3">
                <label for="annualIncome" class="form-label">Annual Income </label>
                <input type="number" class="form-control" id="annualIncome" name="annualIncome" placeholder="0" required>
            </div>

            <!-- Loan Usage -->
            <div class="mb-3">
                <label for="loanUsage" class="form-label">Loan will be used for</label>
                <textarea class="form-control" id="loanUsage" name="loanUsage" rows="2" placeholder="Explain how the loan will be used" required></textarea>
            </div>
<div class="mb-3">
    <label for="loanUsage" class="form-label">Loan will be used for</label>
    <div>
      
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="loanPurpose" id="homeImprovement" value="Home Improvement">
            <label class="form-check-label" for="homeImprovement">Home Improvement</label>
        </div>
        
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="loanPurpose" id="houseBuying" value="House Buying">
            <label class="form-check-label" for="houseBuying">House Buying</label>
        </div>
       
        
    </div>
    <div class="mt-2">
        <input type="text" class="form-control" id="otherPurpose" name="otherPurpose" placeholder="Please type another option here">
    </div>
</div>

            <!-- Contact Information Section -->
            <h4 class="section-title">Contact Information</h4>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="firstName" class="form-label">First Name</label>
                    <input type="text" class="form-control" id="firstName" name="firstName" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="lastName" class="form-label">Last Name</label>
                    <input type="text" class="form-control" id="lastName" name="lastName" required>
                </div>
            </div>

            <!-- Birth Date -->
            <div class="row">
                <div class="col-md-4 mb-3">
                    <label for="birthMonth" class="form-label">Month</label>
                    <select class="form-select" id="birthMonth" name="birthMonth" required>
                        <option value="">Please select a month</option>
                        <!-- Add month options here -->
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="birthDay" class="form-label">Day</label>
                    <select class="form-select" id="birthDay" name="birthDay" required>
                        <option value="">Please select a day</option>
                        <!-- Add day options here -->
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="birthYear" class="form-label">Year</label>
                    <select class="form-select" id="birthYear" name="birthYear" required>
                        <option value="">Please select a year</option>
                        <!-- Add year options here -->
                    </select>
                </div>
            </div>

            <!-- Marital Status -->
            <div class="mb-3">
                <label for="maritalStatus" class="form-label">Marital Status:</label>
                <select class="form-select" id="maritalStatus" name="maritalStatus" required>
                    <option value="">Select your marital status</option>
                    <option value="single">Single</option>
                    <option value="married">Married</option>
                </select>
            </div>

            <!-- E-mail and Phone -->
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="email" class="form-label">E-mail</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="example@example.com" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="phone" class="form-label">Phone</label>
                    <input type="tel" class="form-control" id="phone" name="phone" placeholder="(000) 000-0000" required>
                </div>
            </div>

            <!-- Address -->
            <div class="mb-3">
                <label for="address" class="form-label">Street Address</label>
                <input type="text" class="form-control" id="address" name="address" required>
            </div>
            <div class="mb-3">
                <label for="addressLine2" class="form-label">Street Address Line 2</label>
                <input type="text" class="form-control" id="addressLine2" name="addressLine2">
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="city" class="form-label">City</label>
                    <input type="text" class="form-control" id="city" name="city" required>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="state" class="form-label">State / Province</label>
                    <input type="text" class="form-control" id="state" name="state" required>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="postalCode" class="form-label">Postal / Zip Code</label>
                    <input type="text" class="form-control" id="postalCode" name="postalCode" required>
                </div>
            </div>

            <!-- Employment Information Section -->
            <h4 class="section-title">Employment Information</h4>
            <div class="mb-3">
                <label for="employerName" class="form-label">Present Employer</label>
                <input type="text" class="form-control" id="employerName" name="employerName" required>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="occupation" class="form-label">Occupation</label>
                    <input type="text" class="form-control" id="occupation" name="occupation" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="yearsExperience" class="form-label">Years of Experience</label>
                    <input type="number" class="form-control" id="yearsExperience" name="yearsExperience" required>
                </div>
            </div>

            <!-- Income and Expenses -->
            <div class="mb-3">
                <label for="grossMonthlyIncome" class="form-label">Gross Monthly Income</label>
                <input type="number" class="form-control" id="grossMonthlyIncome" name="grossMonthlyIncome" placeholder="e.g., 1500" required>
            </div>
            <div class="mb-3">
                <label for="monthlyRent" class="form-label">Monthly Rent/Mortgage</label>
                <input type="number" class="form-control" id="monthlyRent" name="monthlyRent" placeholder="e.g., 0 for no rent/mortgage" required>
            </div>
            <div class="mb-3">
                <label for="downPayment" class="form-label">Down Payment Amount</label>
                <input type="number" class="form-control" id="downPayment" name="downPayment" required>
            </div>

            <!-- Comments and Bank References -->
            <div class="mb-3">
                <label for="comments" class="form-label">Comments</label>
                <textarea class="form-control" id="comments" name="comments" rows="3"></textarea>
            </div>
            <div class="mb-3">
                <label for="bankReferences" class="form-label">Bank References</label>
                <textarea class="form-control" id="bankReferences" name="bankReferences" rows="3"></textarea>
            </div>

            <!-- Consent Section -->
            <h4 class="section-title">Consent</h4>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="consentCheck" name="consentCheck" required>
                <label class="form-check-label" for="consentCheck">
                    I authorize prospective Credit Grantors/Lending/Leasing Companies to obtain personal and credit information about me from my employer and credit bureau, or credit reporting agency, any person who has or may have any financial dealing with me, or from any references I have provided. This information, as well as that provided by me in the application, will be referred to in connection with this lease and any other relationships we may establish from time to time. Any personal and credit information obtained may be disclosed from time to time to other lenders, credit bureaus, or other credit reporting agencies. I hereby agree that the information given is true, accurate, and complete as of the date of this application submission.
                </label>
            </div>

            <!-- Submit Button -->
            <div class="d-grid mt-4">
                <button type="submit" class="btn btn-primary btn-lg">Send Application Now</button>
            </div>
        </form>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
