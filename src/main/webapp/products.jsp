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

        <!-- Nội dung trang cửa hàng -->
        <div class="store-page">
            <h1>Đây là trang Cửa hàng</h1>
            <p>Chào mừng bạn đến với cửa hàng của chúng tôi.</p>

            <!-- Menu sản phẩm và bộ lọc -->
            <nav class="product-menu">
                <div class="menu-container">
                    <div class="sort-menu">
                        <label for="sort-options">Sắp xếp theo:</label>
                        <select id="sort-options">
                            <option value="random">Mặc định</option>
                            <option value="price-high-to-low">Giá từ cao đến thấp</option>
                            <option value="price-low-to-high">Giá từ thấp đến cao</option>
                        </select>
                    </div>
                </div>
            </nav>

            <div class="products-container"> <!-- Khung chứa sản phẩm -->
                <!-- Khung danh mục sản phẩm -->
                <div class="categories-container">
                    <div class="product-categories">
                        <h2>Danh mục</h2>
                        <ul>
                            <li><a href="products.jsp">Tất cả</a></li>
                                <%
                                    for (Category category : categories) {
                                %>
                            <li><a href="products.jsp?cid=<%= category.getCat_id()%>"><%= category.getCat_Name()%></a></li>
                                <%
                                    }
                                %>
                            <h5>Khoảng Giá</h5>
                            <form action="products.jsp" method="get" class="price-filter">
                                <label for="minPrice"></label>
                                <input type="number" name="minPrice" id="minPrice" placeholder="TỪ" min="0" step="1000" value="<%= minPriceStr%>">

                                <label for="maxPrice"></label>
                                <input type="number" name="maxPrice" id="maxPrice" placeholder="ĐẾN" min="0" step="1000" value="<%= maxPriceStr%>">

                                <button type="submit">Lọc</button>
                            </form>
                        </ul>
                    </div>
                </div>
                <div class="product-grid">
                    <%
                        for (Product product : products) {
                    %>
                    <div class="product-card">
                        <img src="<%= product.getProImage()%>" alt="<%= product.getProName()%>" class="product-image">
                        <h2 class="product-name"><%= product.getProName()%></h2>
                        <p class="product-price"><%= formatter.format(product.getProPrice())%> VND/kg</p>
                        <button class="buy-button" onclick="goToProductDetail('<%= product.getProId()%>')">Mua Ngay</button>
                    </div>
                    <%
                        }
                    %>
                    <script>
                        function goToProductDetail(productId) {
                            window.location.href = 'Detail.jsp?id=' + productId; // Chuyển hướng đến trang chi tiết sản phẩm
                        }
                    </script>
                </div>
            </div>

            <!-- Menu phân trang -->
            <div class="pagination">
                <button class="pagination-button">Trước</button>
                <button class="pagination-button">1</button>
                <button class="pagination-button">2</button>
                <button class="pagination-button">3</button>
                <button class="pagination-button">Sau</button>
            </div>
        </div>

        <script src="js/pagination-and-sort.js"></script>
    </body>
</html>
