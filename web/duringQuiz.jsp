<%@ page import="functionalPack.Questions" %>
<%@ page import="functionalPack.Quiz" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String mail = (String) request.getSession().getAttribute("email");
    if(mail == null) response.sendRedirect("index.jsp");
    Quiz quiz = (Quiz)request.getSession().getAttribute("quiz");
    String title = quiz.getTitle();
    boolean multi = quiz.getMulti();
    boolean correction = quiz.getCorrection();
    String image = quiz.getImage();
%>
<jsp:include page="header.jsp">
    <jsp:param name="title" value='<%=title%>'/>
</jsp:include>
<div class="container-fluid quiz-cover" style="background-image: url('<%=image%>')">
    <h1><%=title%></h1>
</div>
<div class="container quiz-questions">
    <div class="row">
        <div class="col-sm-10 col-sm-offset-1">
            <form action="AfterQuizServlet" method="post" >
                <%
                    //   System.out.println(quiz.numbOfQuestions()+" grrrrrr");
                    for(int i=0;i<quiz.numbOfQuestions();i++){%>
                <div id="question<%=Integer.toString(i+1)%>">
                    <div class="form-group">
                        <%
                            Questions question = quiz.getQuestion(i);
                            String type = question.getType();
                            String answer = question.getCorrectAnswer();
                            if(type.equals("Question-Response")){
                        %>
                        <h4><%=i+1%>) <%=question.getQuestion()%></h4>
                        <input type="hidden" id="Correct<%=Integer.toString(i+1)%>" value="<%=answer%>">
                        <input type="text" class="form-control" name="Answer<%=Integer.toString(i+1)%>" autocomplete="off">
                        <%
                        } else if(type.equals("Fill in the Blank")) {
                            int ind = question.getQuestion().indexOf('_');
                        %>
                        <input type="hidden" id="Correct<%=Integer.toString(i+1)%>" value="<%=answer%>" >
                        <h4><%=i+1%>) Fill in the blank</h4>
                        <p>
                            <%=question.getQuestion().substring(0,ind)%>
                            <input type="text" name="Answer<%=Integer.toString(i+1)%>" autocomplete="off">
                            <%=question.getQuestion().substring(ind+1,question.getQuestion().length())%>
                        </p>
                        <%
                        } else if(type.equals("Multiple Choice")) {
                        %>
                        <input type="hidden" id="Correct<%=Integer.toString(i+1)%>" value="<%=answer%>" autocomplete="off"/>
                        <h4><%=i+1%>) <%=question.getQuestion()%></h4>
                        <%
                            for(int j=0;j<question.getPossibleAnswersLen();j++){
                                String ans = question.getPossibleAnswer(j);
                        %>
                        <label class="radio" id="radio<%=i+1%>-<%=Integer.toString(j+1)%>">
                            <input type="radio" name="Answer<%=Integer.toString(i+1)%>" value="<%=ans%>" /> <%=ans%>
                        </label>
                        <%
                            }
                        } else if(type.equals("Picture-Response")) {
                        %>
                        <input type="hidden" id="Correct<%=Integer.toString(i+1)%>" value="<%=answer%>" >
                        <h4><%=i+1%>) <%=question.getQuestion()%></h4>
                        <img src="<%=question.getQuestionImage()%>" class="img-responsive" style="margin:0 auto;">
                        <br><br>
                        <input type="text" class="form-control" name="Answer<%=Integer.toString(i+1)%>" autocomplete="off">
                        <%
                            }
                        %>
                        <br>
                        <button type="button" class="btn btn-info" id="Save<%=Integer.toString(i+1)%>" onclick="onSave(<%=Integer.toString(i+1)%>)">Save Answer</button>
                    </div>
                </div>
                <%
                    }
                %>
                <button class="btn btn-default" type ="submit" id="finishBtn" name="action" onclick="submitQuiz()" value="Finish Quiz">Finish Quiz</button>
            </form>
        </div>
    </div>
</div>
<script>
    window.onload = function(){
        if("<%=multi%>"=="false") {
            var i = 0;
            while (true) {
                i++;
                var box = document.getElementById("question" + i);
                if (box != null && i != 1) {
                    box.style.display = "none";
                }
                if (box == null) break;
            }
        }
        if("<%=correction%>"=="false"&&"<%=multi%>"=="true"){
            var i = 0;
            while (true) {
                i++;
                var box = document.getElementById("Save" + i);
                if (box != null) {
                    box.style.display = "none";
                }
                if (box == null) break;
            }
        }
    }
    function onSave(id){
        var save = document.getElementById("Save"+id);
        var answer = document.getElementsByName("Answer"+id);
        var correct = document.getElementById("Correct"+id);
        if("<%=correction%>"=="true"){
            for(var i = 0; i<answer.length; i++){
                var ans = answer[i];
                if(ans.checked&&answer.length>1||answer.length<2){
                    var color;
                    if(answer.length>1){
                        color = document.getElementById("radio"+id+"-"+(i+1));
                    }
                    if(ans.value==correct.value) {
                        if(answer.length>1) {
                            color.style.color = "green";
                        }
                        ans.style.border = "1px solid #00FF00";
                    } else {
                        if(answer.length>1) {
                            color.style.color = "red";
                        }
                        ans.style.border = "1px solid #FF0000";
                    }
                }
            }
        }
        if("<%=multi%>"=="false") {
            var box = document.getElementById("question" + id);
            box.style.opacity = "0.5";
            setTimeout(function(){
                var box2 = document.getElementById("question" + (id+1));
                box.style.display = "none";
                box2.style.display = "inherit";
                if(box2 == null){
                    document.getElementById("finishBtn").style.display = "inherit";
                }
            }, 1000);
        }
        save.disabled = true;
        for(var i = 0; i<answer.length; i++) {
            var ans = answer[i];
            ans.disabled = true;
        }
    }
    function submitQuiz(){
        var id = 0;
        while (true) {
            id++;
            var answer = document.getElementsByName("Answer"+id);
            if (answer == null) break;
            for(var i = 0; i<answer.length; i++) {
                var ans = answer[i];
                ans.disabled = false;
            }
            if(id>200) break;
        }
    }
</script>
<!-- Footer -->
<jsp:include page="footer.jsp"/>