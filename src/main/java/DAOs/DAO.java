package DAOs;

import DB.DBConnection;
import Models.Category;
import Models.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAO {

    private Connection conn;

    public DAO() {
        conn = DBConnection.getConnection(); // Khởi tạo kết nối với cơ sở dữ liệu
    }

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product"; // Câu truy vấn SQL

        try {
            // Sử dụng kết nối đã được khởi tạo
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery(); // Thực thi truy vấn

            while (rs.next()) {
                // Thêm sản phẩm vào danh sách
                list.add(
                        new Product(
                                rs.getInt(1), // pro_id
                                rs.getString(2), // pro_name
                                rs.getString(3), // pro_image
                                rs.getDouble(4), // pro_price
                                rs.getString(5), // pro_description
                                rs.getString(6) // pro_title
                        )
                );
            }
        } catch (SQLException e) {
        }

        return list; // Trả về danh sách sản phẩm
    }

    public List<Product> getAllProductByCID(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product \n"
                + "where cat_id = ?"; // Câu truy vấn SQL

        try {
            // Sử dụng kết nối đã được khởi tạo
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            ResultSet rs = ps.executeQuery(); // Thực thi truy vấn

            while (rs.next()) {
                // Thêm sản phẩm vào danh sách
                list.add(
                        new Product(
                                rs.getInt(1), // pro_id
                                rs.getString(2), // pro_name
                                rs.getString(3), // pro_image
                                rs.getDouble(4), // pro_price
                                rs.getString(5), // pro_description
                                rs.getString(6) // pro_title
                        )
                );
            }
        } catch (SQLException e) {
        }

        return list; // Trả về danh sách sản phẩm
    }

    public Product getAllProductByID(String id) {
        String query = "select * from Product \n"
                + "where pro_id = ?"; // Câu truy vấn SQL

        try {
            // Sử dụng kết nối đã được khởi tạo
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery(); // Thực thi truy vấn

            while (rs.next()) {
                // Thêm sản phẩm vào danh sách

                return new Product(
                        rs.getInt(1), // pro_id
                        rs.getString(2), // pro_name
                        rs.getString(3), // pro_image
                        rs.getDouble(4), // pro_price
                        rs.getString(5), // pro_description
                        rs.getString(6)); // pro_title
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "SELECT * FROM Category"; // Câu truy vấn SQL

        try {
            // Sử dụng kết nối đã được khởi tạo
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery(); // Thực thi truy vấn

            while (rs.next()) {
                // Thêm sản phẩm vào danh sách
                list.add(
                        new Category(
                                rs.getInt(1), // pro_id
                                rs.getString(2) // pro_name 
                        )
                );
            }
        } catch (SQLException e) {
        }

        return list; // Trả về danh sách sản phẩm
    }

    public List<Product> getAllProductByPriceRange(double minPrice, double maxPrice) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE pro_price BETWEEN ? AND ? ";

        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setDouble(1, minPrice);
            ps.setDouble(2, maxPrice);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(
                        new Product(
                                rs.getInt(1), // pro_id
                                rs.getString(2), // pro_name
                                rs.getString(3), // pro_image
                                rs.getDouble(4), // pro_price
                                rs.getString(5), // pro_description
                                rs.getString(6) // pro_title
                        )
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }


    /*public static void main(String[] args) {
        // Khởi tạo đối tượng DAO
        DAO dao = new DAO();

        // ID sản phẩm mà bạn muốn lấy
        String productId = "1"; // Thay đổi ID theo ý muốn

        // Gọi phương thức getAllProductByID
        List<Product> products = dao.getAllProductByID(productId);

        // Kiểm tra và in ra danh sách sản phẩm
        if (products.isEmpty()) {
            System.out.println("Không tìm thấy sản phẩm với ID: " + productId);
        } else {
            for (Product product : products) {
                System.out.println("ID: " + product.getProId());
                System.out.println("Tên: " + product.getProName());
                System.out.println("Hình ảnh: " + product.getProImage());
                System.out.println("Giá: " + product.getProPrice() + " VND");
                System.out.println("Mô tả: " + product.getProDescription());
                System.out.println("Tiêu đề: " + product.getProTitle());
                System.out.println("---------------------------------");
            }
        }
    }*/
}
