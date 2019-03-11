<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 26.11.18
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Dodaj Instruktora</title>

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/instruktor.css" rel="stylesheet">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>

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

        var passwordRepeatValidityChecks = [
            {
                isInvalid: function() {
                    return passwordRepeatInput.value != passwordInput.value;
                },
                invalidityMessage: 'This password needs to match the first one'
            }
        ];
        var usernameInput = document.getElementById('username');
        var passwordInput = document.getElementById('password');
        var passwordRepeatInput = document.getElementById('password_repeat');

        usernameInput.CustomValidation = new CustomValidation(usernameInput);
        usernameInput.CustomValidation.validityChecks = usernameValidityChecks;

        passwordInput.CustomValidation = new CustomValidation(passwordInput);
        passwordInput.CustomValidation.validityChecks = passwordValidityChecks;

        passwordRepeatInput.CustomValidation = new CustomValidation(passwordRepeatInput);
        passwordRepeatInput.CustomValidation.validityChecks = passwordRepeatValidityChecks;

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
<body id="body" class="light-mode">
<center>
<div class="content">
<h1 class="header">Zarejestruj</h1>

    <form:form method="post" modelAttribute="instructor" id="registration" >

    <label for="firstNameId"></label>
    <form:input type="text" path="firstNameInstructor" id="firstNameId" placeholder="Wpisz swoje imię" class="form-control" minlength="3" required=""  />
    <form:errors path="firstNameInstructor" element="div"/>

    <label for="lastNameId"></label>
    <form:input type="text" path="lastNameInstructor" id="lastNameId" placeholder="Wpisz swoje nazwisko" class="form-control"  minlength="2" required="" />
    <form:errors path="lastNameInstructor" element="div"/>

    <label for="loginId"></label>
    <form:input type="text" path="loginInstructor" id="loginId"  placeholder="Wpisz login" title="tylko litery i cyfry bez znaków specjalnych" pattern="^[a-zA-Z0-9]+$" class="form-control" maxlength="100" minlength="5" required="" />
    <form:errors path="loginInstructor" element="div"/>

    <label for="passwordId"></label>
    <form:input type="password" path="password" title="Musi zawierać jedną mała literę, jedną wielką, jedną cyfrę i jeden znak specjalny" placeholder="Ustaw hasło" id="passwordId" class="form-control" maxlength="100" minlength="8" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required="" />
    <form:errors path="password" element="div" cssClass="error"/>


    <label for="emailId"></label>
    <form:input type="text" path="emailInstructor" id="emailId" class="form-control" placeholder="Wpisz swój email" maxlength="100" minlength="2" required="" pattern="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$" />
    <form:errors path="emailInstructor" element="div"/>

    <form:hidden path="createdInstructor"></form:hidden>

    <br>
    <input type="submit" class="btn-liquid" value="Zarejestruj">

</div>
    </form:form>
</center>
<%@ include file="parts/footer.jsp" %>
</body>
</html>
