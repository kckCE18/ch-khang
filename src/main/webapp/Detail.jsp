<%@page import="Models.Category"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.util.List"%>
<%@page import="Models.Product"%>
<%@page import="DAOs.DAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.jsp" />

<%
    // Khởi tạo DAO để truy xuất dữ liệu
    DAO dao = new DAO();
    List<Product> products;
    List<Category> categories = dao.getAllCategory(); // Lấy danh sách các danh mục

    String cid = request.getParameter("cid"); // Lấy ID danh mục từ yêu cầu
    String minPriceParam = request.getParameter("minPrice");
    String maxPriceParam = request.getParameter("maxPrice");
    String minPriceStr = minPriceParam != null ? minPriceParam : "";
    String maxPriceStr = maxPriceParam != null ? maxPriceParam : "";

    if (cid != null && !cid.isEmpty()) {
        products = dao.getAllProductByCID(cid); // Lọc sản phẩm theo danh mục
    } else if (minPriceParam != null && maxPriceParam != null) {
        double minPrice = Double.parseDouble(minPriceParam);
        double maxPrice = Double.parseDouble(maxPriceParam);
        products = dao.getAllProductByPriceRange(minPrice, maxPrice); // Lọc sản phẩm theo khoảng giá
    } else {
        products = dao.getAllProducts(); // Lấy tất cả sản phẩm nếu không có bộ lọc
    }

    // Định dạng giá với dấu phân cách "."
    DecimalFormatSymbols symbols = new DecimalFormatSymbols();
    symbols.setGroupingSeparator('.');
    DecimalFormat formatter = new DecimalFormat("#,###", symbols);
%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Danh Sách Sản Phẩm</title>
        <link rel="stylesheet" href="css/products.css"> <!-- Liên kết đến tệp CSS -->
    </head>
    <body>

      
        
                <div class="product-Detail">
                    <%
                        for (Product product : products) {
                    %>
                    <div class="product-card">
                        <img src="<%= product.getProImage()%>" alt="<%= product.getProName()%>" class="product-image">
                        <h2 class="Detail-name"><%= product.getProName()%></h2>
                        <p class="Detail-price"><%= formatter.format(product.getProPrice())%> VND/kg</p>
                        <p class="Detail-Description"><%= (product.getProDescription())%></p>
                        <button class="buy-button" onclick="goToProductDetail('<%= product.getProId()%>')">Mua Ngay</button>
                    </div>
                    <%
                        }
                    %>
                    
                </div>
            </div>

         

        <script src="js/pagination-and-sort.js"></script>
    </body>
</html>
