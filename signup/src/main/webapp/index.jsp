<%@ page session="true" %>
<%
    // Check if user is logged in
    if (session.getAttribute("name") == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if not logged in
        return; // Stop further processing
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Welcome to RB Bank, your trusted financial partner." />
    <meta name="author" content="Your Name or Company Name" />
    <title>RB - Bank Home Page</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/all.min.css">
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/index-styles.css" rel="stylesheet" />
    
    <style>
        /* Timer positioning */
        #timer {
            position: absolute;
            top: 10px; /* Adjust as needed */
            right: 20px; /* Adjust as needed */
            font-size: 18px; /* Adjust font size as needed */
            background-color: rgba(255, 255, 255, 0.8); /* Optional background for readability */
            padding: 5px; /* Optional padding */
            border-radius: 5px; /* Optional rounded corners */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); /* Optional shadow for better visibility */
        }
    </style>

    <script>
        // Set the timeout duration (30 minutes)
        const timeoutDuration = 30 * 60 * 1000; // 30 minutes in milliseconds
        let timeLeft = timeoutDuration;

        // Display the timer
        function updateTimerDisplay() {
            const minutes = Math.floor((timeLeft / 1000) / 60);
            const seconds = Math.floor((timeLeft / 1000) % 60);
            document.getElementById("timer").innerText = `${minutes}m ${seconds}s`;
        }

        // Start the timer
        const timerInterval = setInterval(() => {
            if (timeLeft <= 0) {
                clearInterval(timerInterval);
                window.location.href = "logout.jsp"; // Redirect to logout page
            } else {
                updateTimerDisplay();
                timeLeft -= 1000; // Decrease time left by 1 second
            }
        }, 1000);

        // Reset the timer on user activity (mouse movement or key presses)
        document.addEventListener("mousemove", resetTimer);
        document.addEventListener("keypress", resetTimer);

        function resetTimer() {
            timeLeft = timeoutDuration; // Reset time left to 30 minutes
            updateTimerDisplay(); // Update the timer display
        }

        // Initialize the timer display
        document.addEventListener("DOMContentLoaded", updateTimerDisplay);
    </script>
</head>
<body>
    <h1>Welcome to the RB Bank Home Page</h1>
    <div id="timer">30m 0s</div> <!-- Timer display at the top right corner -->
    <!-- Your page content goes here -->
</body>


<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top">RB Bank</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
    <ul class="navbar-nav ms-auto">
        <!-- Portfolio Link -->
        <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">Loans</a>
        </li>

        <!-- About Link -->
        <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">About</a>
        </li>

        <!-- Contact Link -->
        <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">Contact</a>
        </li>

        <!-- Logout Link -->
        <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a>
        </li>

        <!-- User Info Link -->
        <li class="nav-item mx-0 mx-lg-1 bg-danger">
            <a class="nav-link py-3 px-0 px-lg-3 rounded" href="profile.jsp">
                <%= session.getAttribute("name") %>
            </a>
        </li>
    </ul>
</div>
</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- Masthead Avatar Image-->
			<img class="masthead-avatar mb-5" src="assets/img/avataaars.jpeg"
				alt="..." />
			<!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">Welcome To RB Bank</h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Masthead Subheading-->
			<p class="masthead-subheading font-weight-light mb-0"> Trusted by thousands, proven by success. Your reliable partner in financial solutions.</p>
		</div>
	</header>
	<!-- Portfolio Section-->
	<section class="page-section portfolio" id="portfolio">
		<div class="container"> 
			<!-- Portfolio Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">Available Loans </h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Portfolio Grid Items-->
			<div class="row justify-content-center">
				<!-- Portfolio Item 1-->
				<div class="col-md-6 col-lg-4 mb-5">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal"
						data-bs-target="#portfolioModal1">
						<div
							class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div
								class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="assets/img/portfolio/health.png"
							alt="..." />
					</div>
				</div>
				<!-- Portfolio Item 2-->
				<div class="col-md-6 col-lg-4 mb-5">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal"
						data-bs-target="#portfolioModal2">
						<div
							class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div
								class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="assets/img/portfolio/houseloan2.jpeg"
							alt="..." />
					</div>
				</div>
				<!-- Portfolio Item 3-->
				<div class="col-md-6 col-lg-4 mb-5">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal"
						data-bs-target="#portfolioModal3">
						<div
							class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div
								class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="assets/img/portfolio/eduloan.png"
							alt="..." />
					</div>
				</div>
		</div>
		</div>


<div class="row">
    <!-- Portfolio Item 1 (Education Loan) -->
    <div class="col-md-6 col-lg-4 mb-5">
        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal1">
            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                <div class="portfolio-item-caption-content text-center text-white">
                    <i class="fas fa-plus fa-3x"></i>
                </div>
            </div>
            <img class="img-fluid" src="assets/img/portfolio/goldloan.jpeg" alt="Education Loan" />
        </div>
    </div>

    <!-- Portfolio Item 2 (Gold Loan 1) -->
    <div class="col-md-6 col-lg-4 mb-5">
        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal2">
            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                <div class="portfolio-item-caption-content text-center text-white">
                    <i class="fas fa-plus fa-3x"></i>
                </div>
            </div>
            <img class="img-fluid" src="assets/img/portfolio/personalloan.jpeg" alt="Gold Loan" />
        </div>
    </div>

    <!-- Portfolio Item 3 (Gold Loan 2) -->
    <div class="col-md-6 col-lg-4 mb-5">
        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal3">
            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                <div class="portfolio-item-caption-content text-center text-white">
                    <i class="fas fa-plus fa-3x"></i>
                </div>
            </div>
            <img class="img-fluid" src="assets/img/portfolio/goldloan.jpg" alt="Gold Loan" />
        </div>
    </div>
</div>

<!-- Modal 1: Gold Loan -->
<div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" aria-labelledby="portfolioModal1" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0">
                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Modal Title -->
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-4">Gold Loan Eligibility</h2>
                            <!-- Icon Divider -->
                            <div class="divider-custom mb-4">
                                <div class="divider-custom-line"></div>
                                <div class="divider-custom-icon">
                                    <i class="fas fa-coins"></i>
                                </div>
                                <div class="divider-custom-line"></div>
                            </div>
                            <!-- Portfolio Modal - Text -->
                            <div class="text-left">
                                <p class="lead mb-4">To qualify for a gold loan, applicants generally need to meet the following criteria:</p>
                                <ul class="list-unstyled">
                                    <li class="mb-3">
                                        <h4 class="text-primary">Gold Ownership:</h4>
                                        <p>Applicants must own gold ornaments, coins, or bars as collateral.</p>
                                    </li>
                                    <li class="mb-3">
                                        <h4 class="text-primary">Minimum Gold Value:</h4>
                                        <p>Typically, the value of gold should meet a certain minimum threshold based on the loan amount.</p>
                                    </li>
                                    <li class="mb-3">
                                        <h4 class="text-primary">Age Limit:</h4>
                                        <p>Applicants must be within the eligible age range, typically 18-65 years.</p>
                                    </li>
                                </ul>
                                   
                                <h4 class="text-secondary mt-4">Required Documents:</h4>
                                <ul class="list-unstyled">
                                    <li class="mb-2">Identity Proof (e.g. Aadhaar, Passport, Driver's License)</li>
                                    <li class="mb-2">Address Proof (e.g., Utility Bill, Lease Agreement)</li>
                                    <li class="mb-2">Gold Valuation Certificate (if required by the bank)</li>
                                </ul>
                            </div>
                            <!-- Apply Now button with link to Gold Loan form -->
                            <a href="forms/goldloan.jsp" class="btn btn-primary mt-4">
                                <i class="fas fa-check fa-fw"></i> Apply Now
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Modal 1: Personal Loan -->
<div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" aria-labelledby="portfolioModal1" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0">
                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Modal Title -->
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-4">Personal Loan Eligibility</h2>
                            <!-- Icon Divider -->
                            <div class="divider-custom mb-4">
                                <div class="divider-custom-line"></div>
                                <div class="divider-custom-icon">
                                    <i class="fas fa-user-friends"></i>
                                </div>
                                <div class="divider-custom-line"></div>
                            </div>
                            <!-- Portfolio Modal - Text -->
                            <div class="text-left">
                                <p class="lead mb-4">To qualify for a personal loan, applicants generally need to meet the following criteria:</p>
                                <ul class="list-unstyled">
                                    <li class="mb-3">
                                        <h4 class="text-primary">Credit Score:</h4>
                                        <p>A good credit score (typically above 650) is often required.</p>
                                    </li>
                                    <li class="mb-3">
                                        <h4 class="text-primary">Income Stability:</h4>
                                        <p>Proof of stable income through employment or business.</p>
                                    </li>
                                    <li class="mb-3">
                                        <h4 class="text-primary">Debt-to-Income Ratio:</h4>
                                        <p>A healthy debt-to-income ratio is usually preferred, typically below 40%.</p>
                                    </li>
                                </ul>
                                   
                                <h4 class="text-secondary mt-4">Required Documents:</h4>
                                <ul class="list-unstyled">
                                    <li class="mb-2">Identity Proof (e.g. Aadhaar, Passport, Driver's License)</li>
                                    <li class="mb-2">Address Proof (e.g., Utility Bill, Lease Agreement)</li>
                                    <li class="mb-2">Income Proof (e.g., Salary Slips, Bank Statements)</li>
                                    <li class="mb-2">Employment Proof (e.g., Offer Letter, Experience Certificate)</li>
                                </ul>
                            </div>
                            <!-- Apply Now button with link to Personal Loan form -->
                            <a href="forms/personalloan.jsp" class="btn btn-primary mt-4">
                                <i class="fas fa-check fa-fw"></i> Apply Now
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal 3: Gold Loan 2 -->
<div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" aria-labelledby="portfolioModal3" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0">
                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-4">Gold Loan 2 Eligibility</h2>
                            <p class="lead mb-4">Eligibility criteria for Gold Loan 2...</p>
                            <a href="forms/goldloan2.jsp" class="btn btn-primary mt-4">
                                <i class="fas fa-check fa-fw"></i> Apply Now
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

			
				</section>
	<!-- About Section-->
	<section class="page-section bg-primary text-white mb-0" id="about">
		<div class="container">
			<!-- About Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-white">About</h2>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- About Section Content-->
			<div class="row">
				<div class="col-lg-4 ms-auto">
					<p class="lead">Founded in 2022, RB Bank is a modern banking institution dedicated to redefining your financial experience. Despite our relatively recent inception, our commitment to innovation, customer care, and community impact drives us to deliver outstanding banking solutions tailored to your needs.</p>
				</div>
				<div class="col-lg-4 me-auto">
					<p class="lead">Our Mission
Our mission is to be a pioneering force in banking, offering cutting-edge financial solutions and exceptional service to help you achieve your financial goals. We are committed to making banking simpler, more accessible, and more personalized for every customer.</p>
				</div>
			</div>
 	<!-- About Section Button-->
			
		</div>
	</section>
<!-- Contact Section-->
<section class="page-section" id="contact">
    <div class="container">
        <!-- Contact Section Heading-->
        <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Contact Us</h2>
        
        <!-- Icon Divider-->
        <div class="divider-custom">
            <div class="divider-custom-line"></div>
            <div class="divider-custom-icon">
                <i class="fas fa-star"></i>
            </div>
            <div class="divider-custom-line"></div>
        </div>
        
        <!-- Contact Section Form-->
        <div class="row justify-content-center">
            <div class="col-lg-8 col-xl-7">
                <!-- Contact Form-->
                <form action="https://api.web3forms.com/submit" method="POST" id="form" class="needs-validation" novalidate>
                    <input type="hidden" name="access_key" value="ff4f362f-3e32-4900-8620-170d2414c073" />
                    <input type="hidden" name="subject" value="New Submission from Contact Form" />
                    <input type="checkbox" name="botcheck" id="" style="display: none;" />
                    
                    <!-- Name Input -->
                    <div class="form-floating mb-3">
                        <input class="form-control" id="first_name" type="text" name="name" placeholder="Enter your first name..." required />
                        <label for="first_name">Full Name</label>
                        <div class="invalid-feedback">A name is required.</div>
                    </div>

                    <!-- Email Input -->
                    <div class="form-floating mb-3">
                        <input class="form-control" id="email" type="email" name="email" placeholder="name@example.com" required />
                        <label for="email">Email Address</label>
                        <div class="invalid-feedback">A valid email address is required.</div>
                    </div>

                    <!-- Phone Number Input -->
                    <div class="form-floating mb-3">
                        <input class="form-control" id="phone" type="text" name="phone" placeholder="+1 (555) 1234-567" required />
                        <label for="phone">Phone Number</label>
                        <div class="invalid-feedback">A phone number is required.</div>
                    </div>

                    <!-- Message Input -->
                    <div class="form-floating mb-3">
                        <textarea class="form-control" id="message" name="message" placeholder="Enter your message here..." style="height: 10rem" required></textarea>
                        <label for="message">Message</label>
                        <div class="invalid-feedback">A message is required.</div>
                    </div>

                    <!-- Submit Button -->
                    <div class="mb-6">
                        <button type="submit" class="btn btn-primary btn-xl">Send Message</button>
                    </div>
                    
                    <!-- Result Display -->
                    <p class="text-base text-center text-gray-400" id="result"></p>
                </form>
            </div>
        </div>
    </div>
</section>

	<!-- Footer-->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<!-- Footer Location-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Location</h4>
					<p class="lead mb-0">
						D-No.408 Street 1 <br /> Hetro,Delhi 522503
					</p>
				</div>
				<!-- Footer Social Icons-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Around the Web</h4>
					<a class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-facebook-f"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-twitter"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-linkedin-in"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-dribbble"></i></a>
				</div>
				<!-- Footer About Text-->
				<div class="col-lg-4">
					<h4 class="text-uppercase mb-4">About RB Bank</h4>
					<p class="lead mb-0">
                     RB Bank, or Rupa-Bujji Limited, is a prominent private bank in India, established in 2020 through local and foreign collaboration to enhance banking services and support economic growth.
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; 2021</small>
		</div>
	</div>
	<!-- Portfolio Modals-->
<!-- Portfolio Modal 1-->
<div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" aria-labelledby="portfolioModal1" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0">
                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Portfolio Modal - Title -->
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-4">Health Loan Eligibility</h2>
                            <!-- Icon Divider -->
                            <div class="divider-custom mb-4">
                                <div class="divider-custom-line"></div>
                                <div class="divider-custom-icon">
                                    <i class="fas fa-heartbeat"></i>
                                </div>
                                <div class="divider-custom-line"></div>
                            </div>
                            <!-- Portfolio Modal - Text -->
                            <div class="text-left">
                                <p class="lead mb-4">To qualify for a health loan, applicants generally need to meet the following criteria:</p>
                                <ul class="list-unstyled">
                                    <li class="mb-3">
                                        <h4 class="text-primary">Credit Score:</h4>
                                        <p>A credit score of 600 or higher is preferred.</p>
                                    </li>
                                    <li class="mb-3">
                                        <h4 class="text-primary">Income:</h4>
                                        <p>Proof of income to demonstrate ability to repay the loan.</p>
                                    </li>
                                    <li class="mb-3">
                                        <h4 class="text-primary">Medical Documents:</h4>
                                        <p>Relevant medical documents from a registered healthcare provider.</p>
                                    </li>
                                </ul>
                                <h4 class="text-secondary mt-4">Required Documents:</h4>
                                <ul class="list-unstyled">
                                    <li class="mb-2">Identity Proof (e.g., Aadhaar, Passport, Driver's License)</li>
                                    <li class="mb-2">Address Proof (e.g., Electricity Bill, Lease Agreement)</li>
                                    <li class="mb-2">Income Proof (e.g., Salary Slips, Tax Returns)</li>
                                    <li class="mb-2">Medical Reports (e.g., Diagnosis, Treatment Estimates)</li>
                                </ul>
                            </div>
                            <a class="btn btn-primary mt-4" href="forms/healthform.jsp">
                                <i class="fas fa-check fa-fw"></i> Apply Now
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Portfolio Modal 2-->
<div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" aria-labelledby="portfolioModal2" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0">
                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Portfolio Modal - Title -->
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-4">Home Loan Eligibility</h2>
                            <!-- Icon Divider -->
                            <div class="divider-custom mb-4">
                                <div class="divider-custom-line"></div>
                                <div class="divider-custom-icon">
                                    <i class="fas fa-home"></i>
                                </div>
                                <div class="divider-custom-line"></div>
                            </div>
                        
                            <!-- Portfolio Modal - Text -->
                            <div class="text-left">
                                <p class="lead mb-4">To qualify for a home loan, applicants generally need to meet the following criteria:</p>
                                <ul class="list-unstyled">
                                    <li class="mb-3">
                                        <h4 class="text-primary">Credit Score:</h4>
                                        <p>A strong credit score (typically 620 or higher) is preferred.</p>
                                    </li>
                                    <li class="mb-3">
                                        <h4 class="text-primary">Income:</h4>
                                        <p>Proof of a stable and sufficient income to cover loan repayments.</p>
                                    </li>
                                    <li class="mb-3">
                                        <h4 class="text-primary">Property:</h4>
                                        <p>The property should meet the lenders' criteria, including valuation and legal requirements.</p>
                                    </li>
                                </ul>
                                   
                                <h4 class="text-secondary mt-4">Required Documents:</h4>
                                <ul class="list-unstyled">
                                    <li class="mb-2">Identity Proof (e.g. Aadhaar, Passport, Driver's License)</li>
                                    <li class="mb-2">Address Proof (e.g., Electricity Bill, Lease Agreement)</li>
                                    <li class="mb-2">Income Proof (e.g., Salary Slips, Tax Returns)</li>
                                </ul>
                            </div>
                            <!-- Updated "Apply Now" button with link to JSP form -->
                            <a href="forms/homeloan.jsp" class="btn btn-primary mt-4">
                                <i class="fas fa-check fa-fw"></i> Apply Now
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Portfolio Modal 3 -->
<div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" aria-labelledby="portfolioModal3" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0">
                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Portfolio Modal - Title -->
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-4">Educational Loan Eligibility</h2>
                            <!-- Icon Divider -->
                            <div class="divider-custom mb-4">
                                <div class="divider-custom-line"></div>
                                <div class="divider-custom-icon">
                                    <i class="fas fa-graduation-cap"></i>
                                </div>
                                <div class="divider-custom-line"></div>
                            </div>
                            <!-- Portfolio Modal - Text -->
                            <div class="text-left">
                                <p class="lead mb-4">To qualify for an educational loan, applicants generally need to meet the following criteria:</p>
                                <ul class="list-unstyled">
                                    <li class="mb-3">
                                        <h4 class="text-primary">Academic Performance:</h4>
                                        <p>Good academic records from previous studies or current enrollment in a recognized institution.</p>
                                    </li>
                                    <li class="mb-3">
                                        <h4 class="text-primary">Age Limit:</h4>
                                        <p>Applicants usually need to be within a certain age range, often 18-35 years.</p>
                                    </li>
                                    <li class="mb-3">
                                        <h4 class="text-primary">Income Proof:</h4>
                                        <p>Proof of income from the student or their family to demonstrate repayment ability.</p>
                                    </li>
                                </ul>
                                   
                                <h4 class="text-secondary mt-4">Required Documents:</h4>
                                <ul class="list-unstyled">
                                    <li class="mb-2">Identity Proof (e.g. Aadhaar, Passport, Driver's License)</li>
                                    <li class="mb-2">Address Proof (e.g., Electricity Bill, Lease Agreement)</li>
                                    <li class="mb-2">Income Proof (e.g., Salary Slips, Tax Returns)</li>
                                </ul>
                            </div>
                            <!-- Updated "Apply Now" button with link to JSP form -->
                            <a href="forms/eduloan.jsp" class="btn btn-primary mt-4">
                                <i class="fas fa-check fa-fw"></i> Apply Now
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Portfolio Modal 3 (Gold Loan) -->
<div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" aria-labelledby="portfolioModal3" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0">
                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Portfolio Modal - Title -->
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-4">Gold Loan Eligibility</h2>
                            <!-- Icon Divider -->
                            <div class="divider-custom mb-4">
                                <div class="divider-custom-line"></div>
                                <div class="divider-custom-icon">
                                    <i class="fas fa-gem"></i> <!-- Icon related to gold or wealth -->
                                </div>
                                <div class="divider-custom-line"></div>
                            </div>
                            <!-- Portfolio Modal - Text -->
                            <div class="text-left">
                                <p class="lead mb-4">To qualify for a gold loan, applicants generally need to meet the following criteria:</p>
                                <ul class="list-unstyled">
                                    <li class="mb-3">
                                        <h4 class="text-primary">Gold Ownership:</h4>
                                        <p>Applicants must own gold ornaments, coins, or bars as collateral.</p>
                                    </li>
                                    <li class="mb-3">
                                        <h4 class="text-primary">Minimum Gold Value:</h4>
                                        <p>Typically, the value of gold should meet a certain minimum threshold based on the loan amount.</p>
                                    </li>
                                    <li class="mb-3">
                                        <h4 class="text-primary">Age Limit:</h4>
                                        <p>Applicants must be within the eligible age range, typically 18-65 years.</p>
                                    </li>
                                </ul>
                                   
                                <h4 class="text-secondary mt-4">Required Documents:</h4>
                                <ul class="list-unstyled">
                                    <li class="mb-2">Identity Proof (e.g. Aadhaar, Passport, Driver's License)</li>
                                    <li class="mb-2">Address Proof (e.g., Utility Bill, Lease Agreement)</li>
                                    <li class="mb-2">Gold Valuation Certificate (if required by the bank)</li>
                                </ul>
                            </div>
                            <!-- Updated "Apply Now" button with link to JSP form for Gold Loan -->
                            <a href="forms/goldloan.jsp" class="btn btn-primary mt-4">
                                <i class="fas fa-check fa-fw"></i> Apply Now
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	
</body>
</html>
