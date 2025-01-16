<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập hệ thống</title>
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
  crossorigin="anonymous"
/>
<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
  crossorigin="anonymous"
></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
<style>
body {
  background: radial-gradient(#6bb9f0, #006EB7);
  height: 100vh;
  overflow: hidden;
}
.hitec-signin {
  display: flex;    
  width: 1000px;
  margin: auto;
  overflow: hidden;
}
.hitec-col-image {
  width: 650px;
}
.hitec-signin-logo {
  margin-top: 50px;
}
.hitec-signin-logo img {
  width: 112px;
  height: 112px;
}
.hitec-signin-image {
  margin-top: 70px;    
}
.hitec-col-signin {
  width: 350px;
}
.hitec-form-signin {
  width: 320px;
  border: 5px solid #6bb9f0;
  background: #f7f7f7;
  padding: 15px;
  height: 370px;
  margin: 0 auto;
  margin-top: 205px;
  position: relative;
}
.hitec-form-signin img {
  border: 5px solid #fff;
  border-radius: 50%;
  position: absolute;
  top: -30px;
  right: 20px;
}
.form-signin-heading {
  font-size: 25px;
  font-weight: bold;
  color: #006eb7;
  margin-bottom: 20px;
}
.hitec-form-signin a.forgot-password {
  display: block;
}
.hitec-form-signin .btn-custom {
  margin: 20px auto;
  width: 100%;
}
footer {
  padding-top: 150px;
  color: #fff;
}
</style>
<%
	String username = "";
	String password = "";
	if(request.getAttribute("username")!=null&& request.getAttribute("password")!=null){
		username = (String) request.getAttribute("username");
		password = (String) request.getAttribute("password");
	}
	if(request.getAttribute("saimk")!=null){
		out.print(request.getAttribute("saimk"));
	}
%>
<body>
    <div class="hitec-signin">
      <div class="hitec-col-image text-center">
        <div class="hitec-signin-logo">
          <a href="#">
            <img src="https://student.husc.edu.vn/Themes/Login/images/Logo-ko-nen.png" alt=""/>
          </a>
        </div>
        <div class="hitec-signin-image">
          <img src="https://student.husc.edu.vn/Themes/Login/images/image1.png" alt="" />
        </div>
      </div>
      <div class="hitec-col-signin">
        <form class="hitec-form-signin" action="" method="post" autocomplete="off">
          <img src="https://student.husc.edu.vn/Themes/Login/images/logo-small.png" alt="" />
          <h2 class="form-signin-heading">SINH VIÊN</h2>
          <div class="form-group mb-2">
            <label for="loginID" class="fw-bold mb-1">Mã sinh viên:</label>
            <input
              type="text"
              name="username"
              class="form-control input-lg"
              placeholder="Mã sinh viên"
              value="<%= username != null ? username : "" %>"
            />
          </div>
          <div class="form-group">
            <label for="password" class="fw-bold mb-1">Mật khẩu:</label>
            <input
              type="password"
              name="password"
              class="form-control input-lg"
              placeholder="Mật khẩu"
              value="<%= password != null ? password : "" %>"
            />
          </div>
          <button class="btn btn-lg btn-primary btn-block btn-custom" type="submit">
            Đăng nhập
          </button>
        </form>
      </div>
    </div>
    <footer>
      <div class="row">
        <div class="col-xs-12 text-center">
          <p>
            <a href="#" style="color: #fff">Trường Đại học Khoa học, Đại học Huế</a>
          </p>
          <p>
            <span class="glyphicon glyphicon-home"></span> 77 Nguyễn Huệ, Thành phố Huế, Tỉnh Thừa
            Thiên Huế, Việt Nam
          </p>
          <p>
            <span class="glyphicon glyphicon-phone"></span> Điện thoại: (+84) 0234.3823290 – Fax:
            (+84) 0234.3824901
          </p>
        </div>
      </div>
    </footer>
</body>
</html>
