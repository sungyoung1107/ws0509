<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let marker_search = {
        init: function () {
            $("#search_btn").click(function () {
                $("#search_form").attr({
                    method: 'get',
                    action: '/marker/search'
                });
                $("#search_form").submit();
            })
        }
    }

    $(function () {
        marker_search.init();
    })
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Marker All</h1>


    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Marker All</h6><br>
            <form class="form-inline well" id="search_form" action="">
                <div class="form-group">
                    <label class="control-label col-sm-4" for="loc">Location: </label>
                    <div class="col-sm-4">
                        <select class="form-control" name="loc">
                            <option value="">전체</option>
                            <option value="s"
                                    <c:if test="${ms.loc=='s'}"> selected</c:if>>서울
                            </option>
                            <option value="b"
                                    <c:if test="${ms.loc=='b'}"> selected</c:if>>부산
                            </option>
                            <option value="j"
                                    <c:if test="${ms.loc=='j'}"> selected</c:if>>제주
                            </option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="title">Title: </label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="title" placeholder="Enter title"
                               name="title" value=${ms.title}>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-2">
                        <button type="button" id="search_btn" class="btn btn-primary">Search</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>IMG</th>
                        <th>ID</th>
                        <th>TITLE</th>
                        <th>TARGET</th>
                        <th>LAT</th>
                        <th>LNG</th>
                        <th>LOC</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>IMG</th>
                        <th>ID</th>
                        <th>TITLE</th>
                        <th>TARGET</th>
                        <th>LAT</th>
                        <th>LNG</th>
                        <th>LOC</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="obj" items="${mlist}">
                        <tr>
                            <td>
                                <a href="" data-toggle="modal" data-target="#target${obj.id}">
                                    <img src="/uimg/${obj.img}" style="width: 30px; height: 30px"/>
                                </a>
                            </td>
                            <td><a href="/marker/detail?id=${obj.id}">${obj.id}</a></td>
                            <td>${obj.title}</td>
                            <td>${obj.target}</td>
                            <td>${obj.lat}</td>
                            <td>${obj.lng}</td>
                            <td>${obj.loc}</td>
                        </tr>
                        <!-- Modal -->
                        <div class="modal fade" id="target${obj.id}" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Detail Image</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>${obj.title}</p>
                                        <p><img src="/uimg/${obj.img}" style="width: 300px; height: 300px"/></p>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="/marker/detail?id=${obj.id}" class="btn btn-info"
                                           role="button">Detail</a>
                                        <a href="/marker/detail?id=${obj.id}" class="btn btn-info" role="button"
                                           data-dismiss="modal">Close</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->