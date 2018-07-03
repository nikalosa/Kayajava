<jsp:include page="header.jsp">
    <jsp:param name="title" value="User Page"/>
    <jsp:param name="login" value="logged"/>
</jsp:include>
<br><br>
<div class="container">
    <div class="row ">
        <div class="col-sm-offset-2 col-sm-8 recent-box">
            <h3>Create a Quiz</h3>
            <div class="col-sm-12">
                <form action="">
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input type="text" class="form-control" id="title">
                    </div>
                    <div class="form-group">
                        <label for="file">Image</label>
                        <input type="file" id="file">
                    </div>
                    <div class="form-group">
                        <label for="category">Image</label>
                        <select name="category" class="form-control" id="category">
                            <option disabled selected>Select Category</option>
                            <option>Cars</option>
                            <option>Movies</option>
                            <option>Rame</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea id="description" class="form-control" name="description" rows="5" cols="5"></textarea>
                    </div>
                    <div id="question">
                        <div class="form-group">
                            <label for="quiz-title-1">Question Title</label>
                            <input type="text" class="form-control" name="quiz-title-1" id="quiz-title-1">
                        </div>
                        <div class="form-group">
                            <label for="quiz-title-1">Answer 1</label>
                            <input type="text" class="form-control" name="quiz-1-answer-1" id="quiz-answer-1">
                        </div>
                        <div class="form-group">
                            <label for="quiz-title-1">Answer 2</label>
                            <input type="text" class="form-control" name="quiz-1-answer-2" id="quiz-answer-1">
                        </div>
                        <div class="form-group">
                            <label for="quiz-title-1">Answer 3</label>
                            <input type="text" class="form-control" name="quiz-1-answer-3" id="quiz-answer-1">
                        </div>
                        <div class="form-group">
                            <label for="quiz-title-1">Answer 4</label>
                            <input type="text" class="form-control" name="quiz-1-answer-4" id="quiz-answer-1">
                        </div>
                    </div>
                    <button type="button" id="addQuestion" class="btn btn-default">Add Question</button>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
