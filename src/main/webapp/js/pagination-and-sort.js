  document.addEventListener("DOMContentLoaded", () => {
    const productsPerPage = 12; // Số sản phẩm hiển thị mỗi trang
    const products = Array.from(document.querySelectorAll(".product-card"));
    const totalPages = Math.ceil(products.length / productsPerPage);
    const paginationButtons = document.querySelectorAll(".pagination-button");
    const sortOptions = document.getElementById("sort-options");
    const originalOrder = [...products]; // Lưu trữ thứ tự ban đầu

    let currentPage = 1;

    function showPage(page) {
        currentPage = page;
        // Ẩn tất cả sản phẩm
        products.forEach((product, index) => {
            product.style.display = (index >= (page - 1) * productsPerPage && index < page * productsPerPage) ? 'block' : 'none';
        });
        
        // Cuộn lên đầu trang
        window.scrollTo(0, 0);
        
        // Cập nhật trạng thái nút phân trang
        updatePaginationButtons();
    }

    function updatePaginationButtons() {
        paginationButtons.forEach((button, index) => {
            if (index === 0) {
                button.style.display = currentPage === 1 ? 'none' : 'inline-block';
            } else if (index === paginationButtons.length - 1) {
                button.style.display = currentPage === totalPages ? 'none' : 'inline-block';
            } else {
                button.style.display = 'inline-block';
                button.classList.remove('active');
                if (index === currentPage) {
                    button.classList.add('active');
                }
            }
        });
    }

    // Thêm sự kiện click cho các nút phân trang
    paginationButtons.forEach((button, index) => {
        button.addEventListener('click', () => {
            if (index === 0 && currentPage > 1) {
                showPage(currentPage - 1); // Nút "Trước"
            } else if (index === paginationButtons.length - 1 && currentPage < totalPages) {
                showPage(currentPage + 1); // Nút "Sau"
            } else if (index > 0 && index < paginationButtons.length - 1) {
                showPage(index); // Các nút trang
            }
        });
    });

    // Hàm sắp xếp sản phẩm
    function sortProducts() {
        const sortValue = sortOptions.value;

        let sortedProducts;
        if (sortValue === "price-high-to-low") {
            sortedProducts = [...originalOrder].sort((a, b) => {
                const priceA = parseInt(a.querySelector('p').innerText.replace(/\D/g, ''));
                const priceB = parseInt(b.querySelector('p').innerText.replace(/\D/g, ''));
                return priceB - priceA; // Sắp xếp từ cao đến thấp
            });
        } else if (sortValue === "price-low-to-high") {
            sortedProducts = [...originalOrder].sort((a, b) => {
                const priceA = parseInt(a.querySelector('p').innerText.replace(/\D/g, ''));
                const priceB = parseInt(b.querySelector('p').innerText.replace(/\D/g, ''));
                return priceA - priceB; // Sắp xếp từ thấp đến cao
            });
        } else {
            // Khi chọn "Mặc định", sử dụng thứ tự ban đầu
            sortedProducts = originalOrder;
        }

        // Cập nhật sản phẩm trong DOM
        const productGrid = document.querySelector(".product-grid");
        productGrid.innerHTML = ""; // Xóa danh sách sản phẩm hiện tại
        sortedProducts.forEach(product => {
            productGrid.appendChild(product); // Thêm sản phẩm đã sắp xếp vào DOM
        });

        // Hiển thị lại trang đầu tiên sau khi sắp xếp
        showPage(1);
    }

    // Thêm sự kiện cho menu sắp xếp
    sortOptions.addEventListener("change", sortProducts);

    // Hiển thị trang đầu tiên khi tải
    showPage(currentPage);
});