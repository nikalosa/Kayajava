$(document).ready(function() {
    var count = 2;
    var question = $('#question').html();
    $( "#addQuestion" ).click(function(){
        question = question.replace("1", count);
        count++;
        $('#question').append(question);
    });
    $('#registrationjs').bootstrapValidator({
        fields: {
            //up part is taken from internet, couse i didnot know how to ovveride bootstrapvalidator. up down
            // i will write validation as my website wants. for this scropt bootstrap validation page is used.
            // http://bootstrapvalidator.votintsev.ru/getting-started/ used this tutorial
            email: {
                validators: {
                    notEmpty: {
                        message: 'Please Enter Email Address'
                    },
                    emailAddress: {
                        message: 'Please Enter Valid Email Address'
                    }
                }
            },

            password: {
                validators: {
                    identical: {
                        field: 'conpass',
                        message: 'Confirm your password below - type same password please'
                    }
                }
            },

            conpass: {
                validators: {
                    identical: {
                        field: 'password',
                        message: 'The password and its confirm are not the same'
                    }
                }
            },

            name: {
                validators: {
                    notEmpty: {
                        message: 'Please Enter username Address'
                    },
                }
            }
        }
    });
    $('#loginjs').bootstrapValidator({
        fields: {
            //up part is taken from internet, couse i didnot know how to ovveride bootstrapvalidator. up down
            // i will write validation as my website wants. for this scropt bootstrap validation page is used.
            // http://bootstrapvalidator.votintsev.ru/getting-started/ used this tutorial
            my_email: {
                validators: {
                    notEmpty: {
                        message: 'Please Enter Email Address'
                    },
                    emailAddress: {
                        message: 'Please Enter Valid Email Address'
                    }
                }
            },

            my_password: {
                validators: {
                    notEmpty: {
                        message: 'Please Enter password Address'
                    }
                }
            },
        }
    });
});