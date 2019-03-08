<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodaj użytkownika</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/register.css" rel="stylesheet">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $( function() {
            $( "#datepicker" ).datepicker(
                {


                    minDate: new Date(1900,1-1,1), maxDate: '-18Y',
                    dateFormat: 'dd/mm/yy',
                    defaultDate: new Date(1970,1-1,1),
                    changeMonth: true,
                    changeYear: true,
                    yearRange: '-110:-18'
                }

            );
        } );

        function CustomValidation(input) {
            this.invalidities = [];
            this.validityChecks = [];

            //add reference to the input node
            this.inputNode = input;

            //trigger method to attach the listener
            this.registerListener();
        }

        CustomValidation.prototype = {
            addInvalidity: function(message) {
                this.invalidities.push(message);
            },
            getInvalidities: function() {
                return this.invalidities.join('. \n');
            },
            checkValidity: function(input) {
                for ( var i = 0; i < this.validityChecks.length; i++ ) {

                    var isInvalid = this.validityChecks[i].isInvalid(input);
                    if (isInvalid) {
                        this.addInvalidity(this.validityChecks[i].invalidityMessage);
                    }

                    var requirementElement = this.validityChecks[i].element;

                    if (requirementElement) {
                        if (isInvalid) {
                            requirementElement.classList.add('invalid');
                            requirementElement.classList.remove('valid');
                        } else {
                            requirementElement.classList.remove('invalid');
                            requirementElement.classList.add('valid');
                        }

                    } // end if requirementElement
                } // end for
            },
            checkInput: function() { // checkInput now encapsulated

                this.inputNode.CustomValidation.invalidities = [];
                this.checkValidity(this.inputNode);

                if ( this.inputNode.CustomValidation.invalidities.length === 0 && this.inputNode.value !== '' ) {
                    this.inputNode.setCustomValidity('');
                } else {
                    var message = this.inputNode.CustomValidation.getInvalidities();
                    this.inputNode.setCustomValidity(message);
                }
            },
            registerListener: function() { //register the listener here

                var CustomValidation = this;

                this.inputNode.addEventListener('keyup', function() {
                    CustomValidation.checkInput();
                });


            }

        };



        /* ----------------------------
            Validity Checks
            The arrays of validity checks for each input
            Comprised of three things
                1. isInvalid() - the function to determine if the input fulfills a particular requirement
                2. invalidityMessage - the error message to display if the field is invalid
                3. element - The element that states the requirement
        ---------------------------- */

        var usernameValidityChecks = [
            {
                isInvalid: function(input) {
                    return input.value.length < 3;
                },
                invalidityMessage: 'This input needs to be at least 3 characters',
                element: document.querySelector('label[for="username"] .input-requirements li:nth-child(1)')
            },
            {
                isInvalid: function(input) {
                    var illegalCharacters = input.value.match(/[^a-zA-Z0-9]/g);
                    return illegalCharacters ? true : false;
                },
                invalidityMessage: 'Only letters and numbers are allowed',
                element: document.querySelector('label[for="username"] .input-requirements li:nth-child(2)')
            }
        ];

        var passwordValidityChecks = [
            {
                isInvalid: function(input) {
                    return input.value.length < 8 | input.value.length > 100;
                },
                invalidityMessage: 'This input needs to be between 8 and 100 characters',
                element: document.querySelector('label[for="password"] .input-requirements li:nth-child(1)')
            },
            {
                isInvalid: function(input) {
                    return !input.value.match(/[0-9]/g);
                },
                invalidityMessage: 'At least 1 number is required',
                element: document.querySelector('label[for="password"] .input-requirements li:nth-child(2)')
            },
            {
                isInvalid: function(input) {
                    return !input.value.match(/[a-z]/g);
                },
                invalidityMessage: 'At least 1 lowercase letter is required',
                element: document.querySelector('label[for="password"] .input-requirements li:nth-child(3)')
            },
            {
                isInvalid: function(input) {
                    return !input.value.match(/[A-Z]/g);
                },
                invalidityMessage: 'At least 1 uppercase letter is required',
                element: document.querySelector('label[for="password"] .input-requirements li:nth-child(4)')
            },
            {
                isInvalid: function(input) {
                    return !input.value.match(/[\!\@\#\$\%\^\&\*]/g);
                },
                invalidityMessage: 'You need one of the required special characters',
                element: document.querySelector('label[for="password"] .input-requirements li:nth-child(5)')
            }
        ];

        var passwordRepeatValidityChecks = [
            {
                isInvalid: function() {
                    return passwordRepeatInput.value != passwordInput.value;
                },
                invalidityMessage: 'This password needs to match the first one'
            }
        ];


        /* ----------------------------
            Setup CustomValidation
            Setup the CustomValidation prototype for each input
            Also sets which array of validity checks to use for that input
        ---------------------------- */

        var usernameInput = document.getElementById('username');
        var passwordInput = document.getElementById('password');
        var passwordRepeatInput = document.getElementById('password_repeat');

        usernameInput.CustomValidation = new CustomValidation(usernameInput);
        usernameInput.CustomValidation.validityChecks = usernameValidityChecks;

        passwordInput.CustomValidation = new CustomValidation(passwordInput);
        passwordInput.CustomValidation.validityChecks = passwordValidityChecks;

        passwordRepeatInput.CustomValidation = new CustomValidation(passwordRepeatInput);
        passwordRepeatInput.CustomValidation.validityChecks = passwordRepeatValidityChecks;




        /* ----------------------------
            Event Listeners
        ---------------------------- */

        var inputs = document.querySelectorAll('input:not([type="submit"])');


        var submit = document.querySelector('input[type="submit"');
        var form = document.getElementById('registration');

        function validate() {
            for (var i = 0; i < inputs.length; i++) {
                inputs[i].CustomValidation.checkInput();
            }
        }

        submit.addEventListener('click', validate);
        form.addEventListener('submit', validate);
    </script>
</head>
<%@ include file="parts/header.jsp" %>

<center>
<body id="body" class="light-mode">


<form:form method="post" modelAttribute="user" id="registration">

    <label for="usernameId">Login:</label>
        <form:input type="text" path="username" id="usernameId" placeholder="Musi mieć przynajmniej 5 znaków" class="form-control" maxlength="100" minlength="5" required="" />
        <form:errors path="username" element="div" cssClass="error"/>



        <label for="passwordId" >Hasło:
        <form:input type="password" path="password" title="Musi zawierać jedną mała literę, jedną wielką, jedną cyfrę i jeden znak specjalny" placeholder="Musi mieć przynajmniej 8 znaków" id="passwordId" class="form-control" maxlength="100" minlength="8" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required="" />
        <form:errors path="password" element="div" cssClass="error"/>

        </label>

    <label for="firstNameId">Imię</label>

    <form:input type="text" path="firstName" id="firstNameId" class="form-control" maxlength="100" minlength="3" required="" />
    <form:errors path="firstName" element="div" cssClass="error"/>


    <label for="lastNameId">Nazwisko</label>

    <form:input type="text" path="lastName" id="lastNameId" class="form-control" maxlength="100" minlength="2" required="" />
    <form:errors path="lastName" element="div" cssClass="error"/>

    <label for="emailId">E-Mail</label>

    <form:input type="text" path="email" id="emailId" class="form-control" maxlength="100" minlength="2" required="" pattern="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$" />
        <form:errors path="email" element="div" cssClass="error"/>

    <label for="genderId">Płeć</label>
    <form:select path="gender" id="genderId" class="form-control">
        <form:option value="M"></form:option>
        <form:option value="K"></form:option>
</form:select>

    <label for="licenceId">Czy posiadasz prawo jazdy kat A?
    <form:select path="licence" id="licenceId" class="form-control">
        <form:option value="Tak"></form:option>
        <form:option value="Nie"></form:option>

    </form:select>

    </label>


    <label for="datepicker">Data urodzenia</label>
    <form:input path="birth" type="text" id="datepicker"/>
    <form:errors path="birth" element="div" cssClass="error"/>

    <%--<label for="activitiesId">Kurs:</label> &nbsp Proszę wybrać jeden!--%>
    <%--<form:select path="activities" id="activitiesId" itemLabel="id" itemValue="id" class="form-control" required="">--%>
        <%--<form:options items="${activities}"/>--%>
    <%--</form:select>--%>
    <%--<form:errors path="activities" element="div" cssClass="error"/>--%>

    <form:hidden path="created"></form:hidden>

    <input type="submit" value="Zarejestruj">
</form:form>

Masz już konto?
<a href="/login"  class="bubbly-button" style="color: white"> Zaloguj się</a>
<%@ include file="parts/footer.jsp" %>
</center>
</body>
</html>
