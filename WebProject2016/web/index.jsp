<%-- 
    Document   : index
    Created on : 19-set-2016, 18.11.07
    Author     : MirkoPortatile
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="full" lang="en">
<!-- Make sure the <html> tag is set to the .full CSS class. Change the background image in the full.css file. -->

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>The Big Picture - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/indexStyle.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<jsp:include page="header.jsp" />


    <!-- Page Content -->
    <div class="container ">
        <div class="row ">
            <div class="col-md-6 col-sm-12 ">
                <h1>TuttoBistro</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni, iusto, unde, sunt incidunt id sapiente rerum soluta voluptate harum veniam fuga odit ea pariatur vel eaque sint sequi tenetur eligendi.</p>
            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12 ">


                <form class="form-inline" role="form" method="get" action="/searchServlet">
                    <div class="row">
                        <div class="form-group col-sm-3">
                            <div class="input-group"> <span class="input-group-addon"><i class="fa fa-envelope-o fa-fw"></i></span>

                                <input type="text" class="form-control" placeholder="Dove?" id="cittaSearchInput"/>
                            </div>
                        </div>
                        <div class="form-group col-sm-3">
                            <div class="input-group"> <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>

                                <input type="text" class="form-control" placeholder="Cosa?" id="cosaSearchInput"/>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-default">Ricerca</button>
                    </div>
                </form>
            </div><!-- /input-group -->
        </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->

    

    <!-- /.container -->

   

</body>

</html>