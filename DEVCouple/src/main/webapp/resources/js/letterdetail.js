function formValidator() {
    var firstN = document.forms["simpleForm"]["firstName"].value;
    var lastN = document.forms["simpleForm"]["lastName"].value;
    var Mobile = document.forms["simpleForm"]["mob"].value;
    var email = document.forms["simpleForm"]["email"].value;

    /* Email Validation */
    var atpos = email.indexOf("@");
    var dotpos = email.lastIndexOf(".");

    if(firstN == "" || firstN == null || lastN == "" || lastN == null || Mobile == "" || Mobile == null || email == "" || email == null) {
        alert("Please complete all the fields first");
    } else if(firstN == lastN) {
        alert("Please enter your name First Name and Last Name Seprately");
    } else if (isNaN(Mobile) || Mobile.length < 10 || Mobile.length > 10) {
        alert("Please enter the Mobile Number in Numeric Characters with a minimum of 10 Digits");
    } else if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= email.length) {
        alert("Please enter a valid email address!");
    } else {
            alert("Thanks for Submitting your Info!");
            return window.location.reload(true);
    }
}