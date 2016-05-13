<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<content tag="title">View Cycles</content>

<content tag="content">
    <section class="content-header">
        <h1>
            View Cycles
        </h1>
    </section>
    <section class="content">

        <div class="row">
            <div class="col-md-12">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Cycles List</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div class="table-responsive">
                            <c:if test="${not empty cycles}">
<<<<<<< HEAD
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Cycle</th>
                                            <th>Actions</th>
=======
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Starting Date</th>
                                        <th>Ending Date</th>                                       
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="cycle" items="${cycles}">
                                        <tr>
                                            <td><c:out value="${cycle.id}"/></td>                                                                                       
                                            <td><c:out value="${cycle.startDate}"/></td>
                                            <td><c:out value="${cycle.endDate}"/></td>                                            
                                            <td>
                                                <button typ e="button" class="btn btn-danger deleteCycle" data-id="${cycle.id}"><i class="fa fa-trash"></i></button>    
                                            </td>
>>>>>>> origin/master
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="cycle" items="${cycles}">
                                            <tr>
                                                <td><c:out value="${cycle.id}"/></td>                                                                                       
                                                <td><c:out value="${cycle.startDate}"/> - <c:out value="${cycle.endDate}"/></td>                                                                         
                                                <td>
                                                    <a href="<c:url value="/cycles/edit/${cycle.id}"/>" class="btn btn-edit">
                                                        <i class="fa fa-edit"></i>
                                                    </a>
                                                    <button typ e="button" class="btn btn-danger deleteCycle" data-id="${cycle.id}"><i class="fa fa-trash"></i></button>    
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if> 
                            <c:if test="${empty cycles}">  
                                <div class="alert alert-warning">The are no available records to view!</div>
                            </c:if>
                        </div>
                    </div><!-- /.box-body -->
                </div>
            </div>
        </div>
    </section>
</content>
<content tag="footerScripts">
    <script src="<c:url value='/resources/js/cycle.js'/>" type="text/javascript"></script>
</content>
