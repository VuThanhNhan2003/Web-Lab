<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Personal Information</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="styles.css"> 
</head>

<body>
    <div class="container">
        <h1>Personal Information</h1>
        <ul id="errorMessages"></ul>
        <form id="personalInfoForm" action="GetInfor" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="id">ID</label>
                <input type="text" id="id" name="id" placeholder="Enter your ID">
            </div>

            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" placeholder="Enter your name">
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
                <label for="major">Major</label>
                <select id="major" name="major">
                    <option value="Business Administration">Business Administration</option>
                    <option value="Computer Science">Computer Science</option>
                    <option value="Economics">Economics</option>
                </select>
            </div>

            <div class="form-group">
                <label for="interest">Interesting Field</label>
                <textarea id="interest" name="interest" placeholder="Reading books, Swimming, etc."></textarea>
            </div>

            <div class="btn-group">
                <button type="submit" class="btn-insert">Insert</button>
                <button type="reset" class="btn-cancel">Cancel</button>
            </div>
        </form>
    </div>

    <script>
        function validateForm() {
            clearErrors();

            let email = document.getElementById("email").value;
            let id = document.getElementById("id").value;
            let name = document.getElementById("name").value;
            let errors = [];
            let isValid = true;

            if (id === "") {
                errors.push("Please enter your ID.");
                isValid = false;
            }

            if (name === "") {
                errors.push("Please enter your name.");
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
