// Except only numbers and dot (.) for salary textbox
function onlyDotsAndNumbers(event) {
    var charCode = (event.which) ? event.which : event.keyCode
    if (charCode == 46) {
        return true;
    }
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;

    return true;
}

//Except only numbers for Age textbox
function onlyNumbers(event) {
    var charCode = (event.which) ? event.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;

    return true;
}

// No alphabets for Emp No textbox
function noAlphabets(event) {
    var charCode = (event.which) ? event.which : event.keyCode
    if ((charCode >= 97) && (charCode <= 122) || (charCode >= 65) && (charCode <= 90))
        return false;

    return true;
}