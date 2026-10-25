
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student List</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f3f6fa;
            margin: 30px;
        }

        h2 {
            color: #243b64;
            text-align: center;
        }

        .container {
            max-width: 1000px;
            margin: auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
        }

        input {
            padding: 9px;
            margin: 5px;
        }

        button, .link {
            padding: 9px 13px;
            background: #2457a7;
            color: white;
            border: none;
            text-decoration: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .delete {
            background: #c62828;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background: #e8eef8;
        }

        .message {
            padding: 12px;
            background: #fff2d5;
            margin-top: 15px;
        }
    </style>
</head>

<body>
<div class="container">

    <h2>Student Management System</h2>

    <p>
        <a class="link"
           href="${pageContext.request.contextPath}/">
            Add New Student
        </a>
    </p>

    <h3>Search Student</h3>

    <form action="${pageContext.request.contextPath}/searchStudent"
          method="get">

        <input type="number" name="regno"
               placeholder="Enter registration number"
               required>

        <button type="submit">Search</button>

        <a class="link"
           href="${pageContext.request.contextPath}/students">
            Show All
        </a>
    </form>

    <c:if test="${searched}">
        <h3>Search Result</h3>

        <c:choose>
            <c:when test="${not empty searchResult}">
                <p>
                    Registration Number:
                    <strong>${searchResult.regno}</strong>
                </p>

                <p>
                    Name: <strong>${searchResult.name}</strong>
                </p>

                <p>
                    CGPA: <strong>${searchResult.cgpa}</strong>
                </p>

                <p>
                    <a class="link"
                       href="${pageContext.request.contextPath}/editStudent/${searchResult.regno}">
                        Edit Student
                    </a>
                </p>
            </c:when>

            <c:otherwise>
                <div class="message">
                    No student found with that registration number.
                </div>
            </c:otherwise>
        </c:choose>
    </c:if>

    <h3>All Students</h3>

    <table>
        <thead>
        <tr>
            <th>Registration Number</th>
            <th>Name</th>
            <th>CGPA</th>
            <th>Actions</th>
        </tr>
        </thead>

        <tbody>
        <c:choose>
            <c:when test="${empty students}">
                <tr>
                    <td colspan="4">No students available.</td>
                </tr>
            </c:when>

            <c:otherwise>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.regno}</td>
                        <td>${student.name}</td>
                        <td>${student.cgpa}</td>

                        <td>
                            <a class="link"
                               href="${pageContext.request.contextPath}/editStudent/${student.regno}">
                                Edit
                            </a>

                            <a class="link delete"
                               href="${pageContext.request.contextPath}/deleteStudent/${student.regno}"
                               onclick="return confirm('Are you sure you want to delete this student?');">
                                Delete
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>

</div>
</body>
</html>
