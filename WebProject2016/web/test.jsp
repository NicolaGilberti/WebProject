<%-- 
    Document   : test
    Created on : 25-gen-2017, 17.00.12
    Author     : Mirko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <form action="NewRestaurant" method="post" enctype="multipart/form-data">
            
            <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                            <label for="nome">Carica una foto</label>
                            <input type="file" class="form-control" id="foto" name="foto">
                        </div>
            
             <div class="row col-md-6 col-lg-12 col-sm-12 col-xs-12 btn-padding">
                    <button type="submit" class="btn btn-default">Inserisci</button>
                    <button type="reset" class="btn btn-warning">Reset</button>
                </div>
        </form>
        
        
    </body>
</html>
