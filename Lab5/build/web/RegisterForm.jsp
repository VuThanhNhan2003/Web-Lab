<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Register Form</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="styles.css"> 
</head>

<body>
    <div class="container">
        <h1>School of Computer Science & Engineering</h1>
        <ul id="errorMessages"></ul>
        <form id="registerForm" action="RegisterServlet" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" id="fullName" name="fullName" placeholder="Enter your full name">
            </div>

            <div class="form-group">
                <label for="id">ID</label>
                <input type="text" id="id" name="id" placeholder="Enter your ID">
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" id="email" name="email" placeholder="Enter your email">
            </div>

            <div class="form-group">
                <label>Gender</label>
                <div class="radio-group">
                    <input type="radio" id="male" name="gender" value="Male">
                    <label for="male">Male</label>
                    <input type="radio" id="female" name="gender" value="Female">
                    <label for="female">Female</label>
                </div>
            </div>

            <div class="form-group">
                <label for="field">Field of Study</label>
                <select id="field" name="field">
                    <option value="CS">CS</option>
                    <option value="IT">IT</option>
                </select>
            </div>

            <div class="form-group">
                <label>List of Subjects</label><br>
                <input type="checkbox" name="subject" value="Principle of EE 1"> Principle of EE 1<br>
                <input type="checkbox" name="subject" value="Computer Network"> Computer Network<br>
                <input type="checkbox" name="subject" value="Web Application Development"> Web Application Development<br>
                <input type="checkbox" name="subject" value="Object Oriented Programming"> Object Oriented Programming<br>
                <input type="checkbox" name="subject" value="Computer Graphics"> Computer Graphics<br>
            </div>

            <div class="form-group">
                <label for="comments">Comments</label>
                <textarea id="comments" name="comments" placeholder="Enter your comments"></textarea>
            </div>

            <div class="btn-group">
                <button type="submit" class="btn-insert">Submit</button>
                <button type="reset" class="btn-cancel">Reset</button>
            </div>
        </form>
    </div>

    <script>
        function validateForm() {
            clearErrors();

            let email = document.getElementById("email").value;
            let id = document.getElementById("id").value;
            let name = document.getElementById("fullName").value;
            let errors = [];
            let isValid = true;

            if (id === "") {
                errors.push("Please enter your ID.");
                isValid = false;
            }

            if (name === "") {
                errors.push("Please enter your full name.");
                isValid = false;
            }

            if (email === "" || !validateEmail(email)) {
                errors.push("Please enter a valid email address.");
                isValid = false;
            }

            if (!isValid) {
                displayErrors(errors);
            }

            return isValid;
        }

        function validateEmail(email) {
            const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return re.test(email);
        }

        function clearErrors() {
            document.getElementById("errorMessages").innerHTML = "";
        }

        function displayErrors(errors) {
            const errorList = document.getElementById("errorMessages");
            errors.forEach(function (error) {
                let li = document.createElement("li");
                li.innerText = error;
                errorList.appendChild(li);
            });
        }
    </script>
</body>

</html>
