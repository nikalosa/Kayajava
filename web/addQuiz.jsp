<jsp:include page="header.jsp">
    <jsp:param name="title" value="User Page - Add Quiz"/>
    <jsp:param name="login" value="logged"/>
</jsp:include>
<br><br>

<form  class="marg"   id="registrationjs" action="createQuizServlet" method="POST" >
    <div class="container">
        <div class="row ">
            <div class="col-sm-offset-2 col-sm-8 recent-box">
                <h3>Create a Quiz</h3>
                <br/><br/>
                <div class="col-sm-12">
                    <form action="">
                        <div class="form-group">
                            <label for="title">Title</label>
                            <input type="text" class="form-control" id="title" name="title">
                        </div>
                        <div class="form-group">
                            <label for="file">Image Link</label>
                            <input type="text" class="form-control" id="file" name = "imgLink">
                        </div>

                        <div class="form-group">
                            <label for="description">Description</label>
                            <textarea id="description" class="form-control" name="description" rows="5" cols="5"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="quizType">Quiz Type</label>
                            <select name="quizType" id="quizType" class="form-control">
                                <option disabled selected>Select Quiz Type</option>
                                <option>Question-Response</option>
                                <option>Fill in the Blank</option>
                                <option>Multiple Choice</option>
                                <option>Picture-Response Questions</option>
                            </select>
                        </div>
                        <div class="form-control">
                            <label for="random">
                                <input type="checkbox" name="random" id="random" value="random"> Random Questions
                            </label>
                        </div>
                        <br>
                        <div class="form-control">
                            <label for="multiple">
                                <input type="checkbox" name="multiple" id="multiple" value="multiple"> One Page (checked) vs Multiple page(unchecked)
                            </label>
                        </div>
                        <br>
                        <div class="form-control">
                            <label for="correction">
                                <input type="checkbox" name="correction" id="correction" value="correction"> Immediate Correction
                            </label>
                        </div>
                        <br>
                        <div id="question-box">
                            <div id="question">
                                <div class="form-group">
                                    <label for="quiz-question-1">Question 1</label>
                                    <input type="text" class="form-control" name="quiz-question-1" id="quiz-question-1">
                                </div>
                                <div class="form-group">
                                    <label for="quiz-question-answer-1">Answer</label>
                                    <input type="text" class="form-control" name="quiz-question-answer-1" id="quiz-question-answer-1">
                                </div>
                                <hr/>
                            </div>
                        </div>
                        <div id="multiple-question-box">
                            <div id="multiple-question">
                                <div class="form-group">
                                    <label for="quiz-question-1">Question 1</label>
                                    <input type="text" class="form-control" name="quiz-multiple-1" id="quiz-multiple-1">
                                    <input type="hidden" id="answerNum-1" value="2"/>
                                </div>
                                <div id="multiple-answer-1">
                                    <div class="form-group" id="answer-box-1-1">
                                        <label for="quiz-multiple-answer-1-1">Answer 1</label>
                                        <input type="text" class="form-control" name="quiz-multiple-answer-1-1" id="quiz-multiple-answer-1-1">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button type="button" onclick="addAnswer(1)" class="btn btn-default">Add Answer</button>
                                    <button type="button" onclick="deleteAnswer(1)" class="btn btn-default">Delete Answer</button>
                                </div>
                                <hr/>
                            </div>
                        </div>
                        <div id="blank-box">
                            <div id="blank">
                                <div class="form-group">
                                    <label for="before-blank-1">Before Blank 1</label>
                                    <textarea name="before-blank-1" class="form-control" id="before-blank-1"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="before-blank-1">Blank 1</label>
                                    <input type="text" class="form-control" name="blank-1" id="blank-1"/>
                                </div>
                                <div class="form-group">
                                    <label for="after-blank-1">After Blank 1</label>
                                    <textarea name="after-blank-1" class="form-control" id="after-blank-1"></textarea>
                                </div>
                                <hr/>
                            </div>
                        </div>
                        <div id="image-box">
                            <div id="image">
                                <div class="form-group">
                                    <label for="image-question-1">Image question 1</label>
                                    <input type="text" class="form-control" id="image-question-1" name="image-question-1">
                                </div>
                                <div class="form-group">
                                    <label for="image-link-1">Image link 1</label>
                                    <input type="text" class="form-control" id="image-link-1" name = "image-link-1">
                                </div>
                                <div class="form-group">
                                    <label for="image-answer-1">Image Answer 1</label>
                                    <input type="text" class="form-control" id="image-answer-1" name = "image-answer-1">
                                </div>
                            </div>
                        </div>
                        <button type="button" id="addQuestion" class="btn btn-default">Add Question</button>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</form>
<jsp:include page="footer.jsp"></jsp:include>
