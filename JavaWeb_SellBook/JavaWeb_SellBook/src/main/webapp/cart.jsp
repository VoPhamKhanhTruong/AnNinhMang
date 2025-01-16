<!DOCTYPE html>
<%@page import="cartModal.cartbo"%>
<%@page import="cartModal.cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sachModal.sach"%>
<%@page import="sachModal.sachbo"%>
<%@page import="loaiModal.loaibo"%>
<%@page import="loaiModal.loai"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<title>Giỏ hàng của bạn</title>
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
<style>
.listSach {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	gap: 25px;
}

p {
	margin: 0;
}

.hidden {
	display: none;
}

.product:not(:last-child) {
	border-bottom: 1px solid black;
}
</style>
</head>
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
					href="sachController">Home </a></li>
				<li class="nav-item"><a class="nav-link" href="cartController">Cart
						<span class="sr-only">(current)</span>
				</a></li>
			</ul>
		</div>
	</nav>

	<div class="container m-auto">
		<form action="cartController" method="post">
			<h1>Giỏ hàng của bạn</h1>
			<hr>
			<div class="cart">
				<%
				cartbo cbo = (cartbo) session.getAttribute("cart");
				if (cbo != null && !cbo.getCartItems().isEmpty()) {
					for (cart s : cbo.getCartItems()) {
				%>
				<div
					class="product w-100 d-flex align-items-center justify-content-between p-2">
					<div>
						<input type="checkbox" name="selectedBooks"
							value="<%=s.getBook().getMasach()%>" onchange="toggleDeleteButton()">
					</div>
					<div>
						<img style="height: 100px" alt="" src="<%=s.getBook().getAnh()%>">
					</div>
					<div>
						<h6><%=s.getBook().getTensach()%></h6>
						<p>
							Giá:
							<%=s.getBook().getGia()%>đ
						</p>
					</div>
					<div>
						<input type="hidden" name="bookId"
							value="<%=s.getBook().getMasach()%>"> <input
							type="number" name="quantity_<%=s.getBook().getMasach()%>"
							value="<%=s.getQuantity()%>" min="1" style="width: 60px;">
						<button type="submit" name="action"
							value="updateId_<%=s.getBook().getMasach()%>"
							class="btn btn-primary">Cập nhật</button>
					</div>
					<div>
						<button type="submit" name="action"
							value="delete_<%=s.getBook().getMasach()%>"
							class="btn btn-danger">Xóa</button>
					</div>
				</div>
				<%
				}
				} else {
				out.println("<p>Không có sách nào trong giỏ hàng.</p>");
				}
				%>
			</div>
			<hr>
			<div>
				<h3>
					Tổng tiền:
					<%=String.format("%.0f", cbo.getTotalAmount())%></h3>
			</div>
			<div class="d-flex">
				<button type="submit" name="action" value="clearAll"
					class="btn btn-danger" style="margin-right: 10px;">Xóa Tất
					Cả</button>

				<button type="submit" name="action" value="deleteSelected" id="deleteSelectedButton"
					class="btn btn-warning hidden">Xóa Sách Chọn</button>

			</div>
		</form>
	</div>
</body>
<script>
	function toggleDeleteButton() {
	    const checkboxes = document.querySelectorAll('input[name="selectedBooks"]');
	    const deleteButton = document.getElementById('deleteSelectedButton');
	    const Checked = Array.from(checkboxes).some(checkbox => checkbox.checked);
	    
	    if (Checked) {
	        deleteButton.classList.remove("hidden");
	    } else {
	        deleteButton.classList.add("hidden");
	    }
	}
	</script>
</html>
