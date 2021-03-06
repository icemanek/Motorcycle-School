<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Dodaj użytkownika</title>

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/register.css" rel="stylesheet">

    <script>

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



        var usernameValidityChecks = [
            {
                isInvalid: function(input) {
                    return input.value.length < 3;
                },
                invalidityMessage: 'Musi mieć przynajmniej 3 znaki',
                element: document.querySelector('label[for="username"] .input-requirements li:nth-child(1)')
            },
            {
                isInvalid: function(input) {
                    var illegalCharacters = input.value.match(/[^a-zA-Z0-9]/g);
                    return illegalCharacters ? true : false;
                },
                invalidityMessage: 'Tylko litery i cifry',
                element: document.querySelector('label[for="username"] .input-requirements li:nth-child(2)')
            }
        ];

        var passwordValidityChecks = [
            {
                isInvalid: function(input) {
                    return input.value.length < 8 | input.value.length > 100;
                },
                invalidityMessage: 'Musi mieć minimum 8 znaków',
                element: document.querySelector('label[for="password"] .input-requirements li:nth-child(1)')
            },
            {
                isInvalid: function(input) {
                    return !input.value.match(/[0-9]/g);
                },
                invalidityMessage: 'Przynajmniej jedna cyfra jest wymagana',
                element: document.querySelector('label[for="password"] .input-requirements li:nth-child(2)')
            },
            {
                isInvalid: function(input) {
                    return !input.value.match(/[a-z]/g);
                },
                invalidityMessage: 'Przynajmniej jedna mała litera jest wymagana',
                element: document.querySelector('label[for="password"] .input-requirements li:nth-child(3)')
            },
            {
                isInvalid: function(input) {
                    return !input.value.match(/[A-Z]/g);
                },
                invalidityMessage: 'Przynajmniej jedna wielka litera jest wymagana',
                element: document.querySelector('label[for="password"] .input-requirements li:nth-child(4)')
            },
            {
                isInvalid: function(input) {
                    return !input.value.match(/[\!\@\#\$\%\^\&\*]/g);
                },
                invalidityMessage: 'Przynajmniej jedna znak specjalny jest wymagany',
                element: document.querySelector('label[for="password"] .input-requirements li:nth-child(5)')
            }
        ];

        var inputs = document.querySelectorAll('input:not([type="submit"])');


        var submit = document.querySelector('input[type="submit"');
        var form = document.getElementById('registration');


        submit.addEventListener('click', validate);
        form.addEventListener('submit', validate);

    </script>


    <script type="text/javascript">
        function Validate() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirm_password").value;

            if (password != confirmPassword) {
               document.getElementById("message").style.color = "red";
               document.getElementById("message").innerHTML = "Hasła nie pasują!";

                return false;
            }
            return true;
        }
    </script>


    </head>
<%@ include file="parts/header.jsp" %>


<body id="body" class="light-mode">

<center>
<form:form method="post" modelAttribute="user" id="registration" name="form">

    <label for="usernameId"></label>
    <form:input type="text" path="username" id="usernameId" placeholder="Wpisz login" title="tylko litery i cyfry bez znaków specjalnych" pattern="^[a-zA-Z0-9]+$" class="form-control" maxlength="100" minlength="5" required="true" />
    <form:errors path="username" element="div" cssClass="error"/>


    <label for="password"></label>
    <form:input type="password"  path="password" title="Musi zawierać jedną mała literę, jedną wielką, jedną cyfrę i jeden znak specjalny" placeholder="Ustaw hasło" id="password" class="form-control" maxlength="100" minlength="8" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required="true" />
    <form:errors path="password" element="div" cssClass="error"/>


   <input type="password" id="confirm_password"  placeholder="Powtórz hasło" required="true">
    <span id="message" ></span>

    <label for="firstNameId"></label>
    <form:input type="text" path="firstName" id="firstNameId" placeholder="Wpisz swoje imię" class="form-control" minlength="3" required="true"  />
    <form:errors path="firstName" element="div" cssClass="error"/>

    <label for="lastNameId"></label>
    <form:input type="text" path="lastName" id="lastNameId" placeholder="Wpisz swoje nazwisko" class="form-control"  minlength="2" required="true" />
    <form:errors path="lastName" element="div" cssClass="error"/>

    <label for="emailId"></label>
    <form:input type="text" path="email" id="emailId" class="form-control" placeholder="Wpisz swój email" maxlength="100" minlength="2" required="true" pattern="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$" />
    <form:errors path="email" element="div" cssClass="error"/>

    <label for="genderId"></label>
    <form:select path="gender" id="genderId" class="form-control" required="true">
        <form:option value="" >Płeć</form:option>
        <form:option value="M">Mężczyzna</form:option>
        <form:option value="K">Kobieta</form:option>
</form:select>

    <label for="licenceId"></label>
    <form:select path="licence" id="licenceId" class="form-control" required="true">
        <form:option value="">Czy posiadasz prawo jazdy kat A?</form:option>
        <form:option  value="Tak">Tak</form:option>
        <form:option disabled="true" value="Nie">Nie-jeśli nie posiadasz nie możesz się zarejestrować</form:option>
    </form:select>

    <label for="dateId"></label>
    <form:input path="birth" type="date" id="dateId" value="2001-01-01" max="2001-01-01" required="true" />

    <form:hidden path="created" />

    <br>
    <input type="reset" class="btn-liquid" value="Wyczyść">
    <input type="submit" class="btn-liquid" name="submit" onclick="return Validate()" value="Zarejestruj">

    <p>Masz konto? <a href="/login">Zaloguj się!</a></p>
    <p>Jesteś instruktorem?<a href="/instructor/add">Kliknij tutaj</a></p>

</form:form>
</center>


<%@ include file="parts/footer.jsp" %>

</body>
</html>
