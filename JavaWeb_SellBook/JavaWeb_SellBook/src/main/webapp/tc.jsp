<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="sachModal.sach"%>
<%@page import="sachModal.sachbo"%>
<%@page import="loaiModal.loaibo"%>
<%@page import="loaiModal.loai"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</head>
<style>
.listSach {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	gap: 25px;
}

.card img {
	height: 190px;
}
</style>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light mb-3">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="sachController">Home <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="cartController">Cart</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="cart.jsp">Xác
						nhận đặt mua</a></li>
				<li class="nav-item"><a class="nav-link" href="cart.jsp">Lịch
						sử mua hàng</a></li>
			</ul>
		</div>
	</nav>

	<div class="px-4">
		<div class="row">
			<div class="col-sm-2">
				<a href="sachController">Tất cả</a>
				<hr />
				<%
				ArrayList<loai> dsloai = (ArrayList<loai>) request.getAttribute("dsloai");
				if (dsloai != null && !dsloai.isEmpty()) {
					for (loai l : dsloai) {
				%>
				<a href="sachController?ml=<%=l.getMaloai()%>"> <%=l.getTenloai()%></a>
				<hr />
				<%
				}
				}
				%>
			</div>
			<div class="col-sm-8 listSach">
				<%
				sachbo sbo = new sachbo();
				ArrayList<sach> ds = (ArrayList<sach>) request.getAttribute("dssach");

				if (ds != null && !ds.isEmpty()) {
					for (sach s : ds) {
				%>
				<div class="card">
					<img class="card-img-top" src="<%=s.getAnh()%>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class=""><%=s.getTensach()%></h5>
						<p class="card-text">
							tac gia
							<%=s.getTacgia()%></p>
						<div class="row gap-2">
							<form method="post" class="col-6 w-100 p-1"
								action="cartController">
								<input type="hidden" name="id" value="<%=s.getMasach()%>">
								<input type="hidden" name="action" value="buy">
								<button type="submit" class="btn btn-primary w-100"
									style="font-size: 14px">Buy</button>
							</form>
							<form method="post" class="col-6 w-100 p-1"
								action="cartController">
								<input type="hidden" name="id" value="<%=s.getMasach()%>">
								<input type="hidden" name="action" value="addToCart">
								<button type="submit" class="btn btn-primary w-100"
									style="font-size: 14px">Add to cart</button>
							</form>
						</div>
					</div>
				</div>
				<%
				}
				} else {
				out.println("<p>Không có sách nào.</p>");
				}
				%>
			</div>
			<div class="col-sm-2">
				<%
				String ml = (String) request.getAttribute("maLoai");
				String key = (String) request.getAttribute("key");
				%>
				<form method="post" action="sachController">
					<input type="text" class="form-control" name="q"
						placeholder="Tìm kiếm sách..." value="<%=key != null ? key : ""%>">
					<input type="hidden" name="ml" value="<%=ml != null ? ml : ""%>">
					<button type="submit" class="btn btn-primary">Tìm kiếm</button>
				</form>
			</div>
		</div>
	</div>

</body>
</html>