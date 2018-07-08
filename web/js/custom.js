$(document).ready(function() {
    $('[data-toggle="tooltip"]').tooltip();
    var pointer;
    var count1 = 2;
    var count2 = 2;
    var count3 = 2;
    var count4 = 2;
    $("#question-box").hide();
    $("#multiple-question-box").hide();
    $("#image-box").hide();
    $("#blank-box").hide();
    $("#addQuestion").hide();
    $("#quizType").change(function(){
        $("#addQuestion").show();
        if(this.value == "Question-Response") {
            $("#question-box").show();
            $("#multiple-question-box").hide();
            $("#image-box").hide();
            $("#blank-box").hide();
            pointer = "#question";
        } else if(this.value == "Fill in the Blank") {
            $("#question-box").hide();
            $("#multiple-question-box").hide();
            $("#image-box").hide();
            $("#blank-box").show();
            pointer = "#blank";
        } else if(this.value == "Multiple Choice") {
            $("#question-box").hide();
            $("#multiple-question-box").show();
            $("#image-box").hide();
            $("#blank-box").hide();
            pointer = "#multiple-question";
        } else {
            $("#question-box").hide();
            $("#multiple-question-box").hide();
            $("#image-box").show();
            $("#blank-box").hide();
            pointer = "#image";
        }
    });

    var multiple_answer = $("#multiple-answer-1").html();
    deleteAnswer = function (id){
        var answerNum = $("#answerNum-"+id).val()-1;
        if(answerNum==1){
            alert("Can't delete last answer box");
            return;
        }
        $("#answer-box-"+id+"-"+answerNum).remove();
        $("#answerNum-"+id).val(answerNum);
    }
    addAnswer = function (id){
        var answerNum = $("#answerNum-"+id).val();
        var tmp = multiple_answer;
        var str = "quiz-multiple-answer-"+id+"-1";
        var re = new RegExp(str, "g");
        tmp = tmp.replace(re, 'quiz-multiple-answer-'+id+'-'+answerNum);
        tmp = tmp.replace(/answer-box-1-1/g, 'answer-box-'+id+'-'+answerNum);
        tmp = tmp.replace('Answer 1', 'Answer '+answerNum);
        answerNum++;
        $("#answerNum-"+id).val(answerNum);
        $("#multiple-answer-"+id).append(tmp);
    }

    var multiple_question = $('#multiple-question').html();
    $("#addQuestion").click(function(){
        if(pointer == "#multiple-question") {
            var tmp = multiple_question;
            tmp = tmp.replace(/quiz-multiple-1/g, 'quiz-multiple-'+count2);
            tmp = tmp.replace(/quiz-question-1/g, 'quiz-question-'+count2);
            tmp = tmp.replace(/answerNum-1/g, 'answerNum-'+count2);
            tmp = tmp.replace(/multiple-answer-1/g, 'multiple-answer-'+count2);
            tmp = tmp.replace(/answer-box-1/g, 'answer-box-'+count2+'-1');
            tmp = tmp.replace(/quiz-multiple-answer-1-1/g, 'quiz-multiple-answer-'+count2+'-1');
            tmp = tmp.replace('addAnswer(1)', 'addAnswer('+count2+')');
            tmp = tmp.replace('deleteAnswer(1)', 'deleteAnswer('+count2+')');
            tmp = tmp.replace('Question 1', 'Question '+count2);
            count2++;
            $(pointer+'-box').append(tmp);
        } else if(pointer == "#question") {
            var question = $(pointer).html();
            question = question.replace(/1/g, count1);
            count1++;
            $(pointer+'-box').append(question);
        } else if(pointer == "#blank") {
            var question = $(pointer).html();
            question = question.replace(/1/g, count3);
            count3++;
            $(pointer+'-box').append(question);
        } else if(pointer == "#image"){
            var question = $(pointer).html();
            question = question.replace(/1/g, count4);
            count4++;
            $(pointer+'-box').append(question);
        }
    });

    // var answer = $("#answer-box").html();
    // $( "#addAnswer" ).click(function(){
    //     var tmp = answer;
    //     tmp = tmp.replace(/1/g,count);
    //     count++;
    //     $("#multiple-answer").append(tmp);
    // });

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