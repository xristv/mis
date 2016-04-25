<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Create doctor</title>
    </head>
    <body>
        <section class="content-header">
            <h1>
                Create doctor
            </h1>
        </section>
        <section class="content">

            <div class="row">
                <div class="col-md-12">
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">Create doctor</h3>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <form role="form" action="<c:url value="/doctors/store"/>" method="POST">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>First Name:</label>
                                            <input name="firstName" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Last Name:</label>
                                            <input name="lastName" class="form-control">
                                        </div>
                                    </div>                                    
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Email:</label>
                                            <input name="email" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Address:</label>
                                            <input name="address" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Geographical Area:</label>
                                            <select name="geolocationAreaId" class="form-control">
                                                <c:forEach var="area" items="${geolocationAreas}">
                                                    <option value="${area.id}">${area.name}</option>
                                                </c:forEach>
                                            </select>                                       
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>City</label>
                                            <select name="cityId" class="form-control">
                                                <c:forEach var="city" items="${cities}">
                                                    <option value="${city.id}">${city.name}</option>
                                                </c:forEach>
                                            </select>     
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Phone:</label>
                                            <input name="phone" class="form-control">
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Position:</label>
                                            <input name="position" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Institution</label>
                                            <select name="institutionId" class="form-control">
                                                <c:forEach var="institution" items="${institutions}">
                                                    <option value="${institution.id}">${institution.name}</option>
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
    </body>