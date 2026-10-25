
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Management</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f3f6fa;
            margin: 40px;
        }

        .container {
            max-width: 500px;
            margin: auto;
            padding: 25px;
            background: white;
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            color: #243b64;
        }

        label {
            display: block;
            margin-top: 15px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            box-sizing: border-box;
        }

        button, .link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 16px;
            background: #2457a7;
            color: white;
            border: none;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>

<body>
<div class="container">

    <h2>
        <c:choose>
            <c:when test="${isEdit}">
                Update Student
            </c:when>
            <c:otherwise>
                Add Student
            </c:otherwise>
        </c:choose>
    </h2>

    <form action="${pageContext.request.contextPath}/saveStudent"
          method="post">

        <label>Registration Number:</label>

        <c:choose>
            <c:when test="${isEdit}">
                <input type="number" name="regno"
                       value="${student.regno}"
                       readonly required>
            </c:when>
            <c:otherwise>
                <input type="number" name="regno"
                       value="${student.regno}"
                       required>
            </c:otherwise>
        </c:choose>

        <label>Student Name:</label>
        <input type="text" name="name"
               value="${student.name}" required>

        <label>CGPA:</label>
        <input type="number" name="cgpa"
               value="${student.cgpa}"
               min="0" max="10" step="0.01" required>

        <button type="submit">
            <c:choose>
                <c:when test="${isEdit}">
                    Update Student
                </c:when>
                <c:otherwise>
                    Save Student
                </c:otherwise>
            </c:choose>
        </button>

        <a class="link"
           href="${pageContext.request.contextPath}/students">
            View Students
        </a>

    </form>

</div>
</body>
</html>
