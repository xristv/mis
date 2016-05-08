<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<content tag="title">Pay Visit</content>

<content tag="content">
    <section class="content-header">
        <h1>
            Pay Visit
        </h1>
    </section>
    <section class="content">

        <div class="row">
            <div class="col-md-12">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Pay Visit</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <form role="form" action="<c:url value="/PaidVisits/store" />" method="POST">
                            <div class="row">
                                <input type="hidden" name="id" value="${schv.id}">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Medical Visitor Name:</label><br/>
                                        <label>${schv.medicalVisitor.firstName} ${schv.medicalVisitor.lastName}</label>
                                    </div>
                                </div>                            
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Cycle:</label><br/>
                                        <label>${schv.cycle.startDate} - ${schv.cycle.endDate}</label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Doctor Name: </label><br/>
                                        <label>${schv.doctor.firstName} ${schv.doctor.lastName}</label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Status: </label><br/>
                                        <label>${schv.status}</label>
                                    </div>
                                </div> 
                            </div>                          
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Week</label>                                        
                                         <select name="week" class="form-control">                                         
                                                <option value="1">Week 1</option>
                                                <option value="2">Week 2</option>
                                                <option value="3">Week 3</option>
                                                <option value="4">Week 4</option>
                                        </select>  
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Hour</label>                                          
                                         <select name="hour" class="form-control">                                         
                                                <option value="AM">AM</option>
                                                <option value="PM">PM</option>                                            
                                        </select>  
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Group</label>                                       
                                        <select name="group" class="form-control">                                         
                                                <option value="NO">NO</option>
                                                <option value="YES">YES</option>                                            
                                        </select>  
                                    </div>          
                                </div>
                            </div>
                            <div class="row">
                               <div class="col-md-8">
                                    <div class="form-group">
                                        <label>Comment</label>
                                        <textarea name="comment" class="form-control"></textarea>                                 
                                    </div>
                                </div> 
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Date</label>
                                         <input name="date" type="text" class="form-control">                                           
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

<content tag="footerScripts">
    <script type="text/javascript">
            $('.form-group input').datepicker({
        format: "dd-mm-yyyy"
    });
    </script>
</content>                                   