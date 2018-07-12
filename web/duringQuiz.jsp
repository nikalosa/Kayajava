<%@ page import="functionalPack.Questions" %>
<%@ page import="functionalPack.Quiz" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Quiz quiz = (Quiz)request.getSession().getAttribute("quiz");
    String title = quiz.getTitle();
    boolean multi = quiz.getMulti();
    boolean correction = quiz.getCorrection();
%>
<jsp:include page="header.jsp">
    <jsp:param name="title" value='<%=title%>'/>
</jsp:include>
<div class="container" onload="onLoad()">
    <div class="row">
        <div class="col-sm-10 col-sm-offset-1">
            <h1><%=title%></h1>
            <form action="AfterQuizServlet" method="post" >
                <%
                for(int i=0;i<quiz.numbOfQuestions();i++){%>
                    <div id="question<%=Integer.toString(i+1)%>">
                        <div class="form-group">
                    <%
                    Questions question = quiz.getQuestion(i);
                    String type = question.getType();
                    String answer = question.getCorrectAnswer();
                    if(type.equals("Question-Response")){
                    %>
                            <label><%=question.getQuestion()%></label>
                            <input type="hidden" id="Correct<%=Integer.toString(i)%>" value="<%=answer%>" >
                            <input type="text" class="form-control" name="Answer<%=Integer.toString(i)%>">
                    <%
                    } else if(type.equals("Fill in the Blank")) {
                        int ind = question.getQuestion().indexOf('_');
                    %>
                            <input type="hidden" id="Correct<%=Integer.toString(i)%>" value="<%=answer%>" >
                            <p>
                                <%=question.getQuestion().substring(0,ind)%>
                                <input type="text" name="Answer<%=Integer.toString(i)%>">
                                <%=question.getQuestion().substring(ind+1,question.getQuestion().length())%>
                            </p>
                    <%
                    } else if(type.equals("Multiple Choice")) {
                    %>
                            <input type="hidden" id="Correct<%=Integer.toString(i)%>" value="<%=answer%>" />
                            <label><%=question.getQuestion()%></label>
                        <%
                        for(int j=0;j<question.getPossibleAnswersLen();i++){
                            String ans = question.getPossibleAnswer(j);
                        %>
                            <input type="radio" class="form-control" name="Answer<%=Integer.toString(i)%>%>" value="<%=ans%>" /> <%=ans%>
                    <%
                        }
                    } else if(type.equals("Picture-Response")) {
                    %>
                            <input type="hidden" id="Correct<%=Integer.toString(i)%>" value="<%=answer%>" >
                            <label><%=question.getQuestion()%></label>
                            <img src="<%=question.getQuestionImage()%>" class="img-responsive" >
                            <input type="text" class="form-control" name="Answer<%=Integer.toString(i)%>">
                    <%
                    }
                    %>
                            <button type="button" class="btn btn-info" id="Save<%=Integer.toString(i+1)%>" onclick="onSave(<%=Integer.toString(i+1)%>)">Save Answer</button>
                        </div>
                    </div>
                <%
                }
                %>
                <button class="btn btn-default" type ="submit" name="action" value="Finish Quiz">Finish Quiz</button>
            </form>
        </div>
    </div>
</div>
<script>
    function onLoad(){
        if("<%=multi%>"=="true") {
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
    }
    function onSave(id){
        var save = document.getElementById("Save"+id);
        var answer = document.getElementsByName("Answer"+id);
        var correct = document.getElementById("Correct"+id);
        if("<%=correction%>"=="true"){
            if(answer.value()==correct.value()) {
                answer.style.border = "1px solid #00FF00";
            } else {
                answer.style.border = "1px solid #FF0000";
            }
        }
        if("<%=multi%>"=="true") {
            box.style.opacity = "0.5";
            setTimeout(function(){
                var box1 = document.getElementById("question" + id);
                var box2 = document.getElementById("question" + (id+1));
                box1.style.display = "none";
                box2.style.display = "inherit";
            }, 1000);
        }
        save.disabled = "true";
        answer.disabled = "true";
    }
</script>
<!-- Footer -->
<jsp:include page="footer.jsp"/>