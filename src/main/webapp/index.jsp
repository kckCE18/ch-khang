<%-- 
    Document   : index.jsp
    Created on : Oct 22, 2024, 10:48:10 PM
    Author     : KimChiKhang_CE180324
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Halona Fruits - Cửa hàng</title>
    <link rel="stylesheet" href="css\products.css">
</head>
<body>
    <!-- Top Banner -->
    <div class="top-banner">Thực phẩm sạch</div>

    <!-- Menu điều hướng chung -->
    <header>
        <div class="container">
            <div class="logo">
                <img src="logo.png" alt="Logo Halona Fruits">
            </div>
            <div class="search-bar">
                <input type="text" placeholder="Tìm kiếm...">
                <button>Tìm</button>
            </div>
            <nav>
                <ul>
                    <li><a href="index.jsp">Trang chủ</a></li>
                    <li><a href="products.jsp">Sản phẩm</a></li>
                    <li><a href="#">Giới thiệu</a></li>
                    <li><a href="#">Tin tức</a></li>
                    <li><a href="#">Liên hệ</a></li>
                </ul>
            </nav>
            <div class="actions">
                <a href="#"><i class="fas fa-shopping-cart"></i> Giỏ hàng</a>
            </div>
        </div>
    </header>

    <!-- Nội dung trang Cửa hàng -->
    <div class="store-page">
        <h1>Đây là trang chủ </h1>
        <p>Chào mừng bạn đến với cửa hàng của chúng tôi.</p>
    </div>
    
</body>
</html>
