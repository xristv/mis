<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<content tag="title">Create new visits</content>

<content tag="content">
    <section class="content-header">
        <h1>
            Create New Visits
        </h1>
    </section>
    <section class="content">

        <div class="row">
            <div class="col-md-12">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Create New Visit</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <form role="form" action="<c:url value="/ScheduledVisits/store"/>" method="POST">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Medical Visitor:</label>
                                        <select name="medicalVisitorId" class="form-control">
                                            <c:forEach var="medVisitor" items="${visitors}">                     
                                                <option value="${medVisitor.id}">${medVisitor.firstName} ${medVisitor.lastName}</option>                                                   
                                            </c:forEach>
                                        </select>                                       
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Doctors</label>
                                        <select name="doctorId" class="form-control">
                                            <c:forEach var="doc" items="${doctors}">
                                                <option value="${doc.id}">${doc.firstName} ${doc.lastName}</option>
                                            </c:forEach>
                                        </select>     
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Cycle</label>
                                        <select name="cycleId" class="form-control">
                                            <c:forEach var="cycle" items="${cycles}">
                                                <option value="${cycle.id}">${cycle.startDate} - ${cycle.endDate}</option>
                                            </c:forEach>
                                        </select>     
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-default">Save</button>
                        </form>
                    </div><!-- /.box-body -->
                </div>
            </div>
        </div>
    </section>
</content>