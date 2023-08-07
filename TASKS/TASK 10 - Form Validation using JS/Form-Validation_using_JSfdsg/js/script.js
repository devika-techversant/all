const form = document.getElementById("formToValidate");
const firstName = document.getElementById("firstName");
const lastName = document.getElementById("lastName");
const phoneNumber = document.getElementById("phoneNumber");
const emailID = document.getElementById("emailID");
const password = document.getElementById("password");
document.getElementById("male").checked = true; //keep male option selected in the beginning

function checkForDefault(event) {
    event.preventDefault(); //built-in
    validateInputs(); //call function validateInputs()
}

form.addEventListener("submit", checkForDefault);   //call function checkForDefault()

// form.addEventListener("submit", function(event) {
//     event.preventDefault();
//     validateInputs();
// });

function setError(element, message) {
    const inputControl = element.parentElement; //This line retrieves the parent element of the input element passed as the "element" parameter. 
    const errorDisplay = inputControl.querySelector(".errorMessage");

    errorDisplay.innerHTML = message;   //Add error message

    inputControl.classList.add("errorStyle");
    inputControl.classList.remove("successStyle");
}

function setSuccess(element) {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector(".errorMessage");

    errorDisplay.innerHTML = "";    //Remove error message
    
    inputControl.classList.add("successStyle");
    inputControl.classList.remove("errorStyle");
}

function isValidName(name) {
    // regEx is written just to know that it's a regular expression
    let regEx = /^[a-zA-Z\-]+$/;    
    return regEx.test(name);
}

function isValidEmail(emailID) {
    // regEx is written just to know that it's a regular expression
    let regEx = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return regEx.test(String(emailID).toLowerCase());
}

function isValidNumber(phoneNumber) {
    // regEx is written just to know that it's a regular expression
    let regEx = /^\d{10}$/;
    return regEx.test(phoneNumber);
}

function validateInputs() {
    const firstNameValue = firstName.value.trim();
    const lastNameValue = lastName.value.trim();
    const emailIDValue = emailID.value.trim();
    const passwordValue = password.value.trim();
    const phoneNumberValue = phoneNumber.value.trim();

    if (firstNameValue === "") {
        setError(firstName, "First Name is required");
    } else if (!isValidName(firstNameValue)) {
        setError(firstName, "Please provide a valid first name");
    } else {
        setSuccess(firstName);
    }

    if (lastNameValue === "") {
        setError(lastName, "Second Name is required");
    } else if (!isValidName(lastNameValue)) {
        setError(lastName, "Please provide a valid last name");
    } else {
        setSuccess(lastName);
    }

    if (emailIDValue === "") {
        setError(emailID, 'Email is required');
    } else if (!isValidEmail(emailIDValue)) {
        setError(emailID, "Provide a valid email address");
    } else {
        setSuccess(emailID);
    }

    if (phoneNumberValue === "") {
        setError(phoneNumber, "Please enter your phone number");
    } else if (!isValidNumber(phoneNumberValue)) {
        setError(phoneNumber, "Provide a valid phone number");
    } else {
        setSuccess(phoneNumber);
    }

    if (passwordValue === "") {
        setError(password, "Password is required");
    } else if (passwordValue.length < 8) {
        setError(password, "Password must be at least 8 characters.");
    } else {
        setSuccess(password);
    }
    
}