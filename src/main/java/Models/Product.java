package Models;

public class Product {
    private int proId;
    private String proName;
    private String proImage;
    private double proPrice;
    private String proDescription;
    private String proTitle;

    public Product() {
    }

    public Product(int proId, String proName, String proImage, double proPrice, String proDescription, String proTitle) {
        this.proId = proId;
        this.proName = proName;
        this.proImage = proImage;
        this.proPrice = proPrice;
        this.proDescription = proDescription;
        this.proTitle = proTitle;
    }

    public int getProId() {
        return proId;
    }

    public void setProId(int proId) {
        this.proId = proId;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public String getProImage() {
        return proImage;
    }

    public void setProImage(String proImage) {
        this.proImage = proImage;
    }

    public double getProPrice() {
        return proPrice;
    }

    public void setProPrice(double proPrice) {
        this.proPrice = proPrice;
    }

    public String getProDescription() {
        return proDescription;
    }

    public void setProDescription(String proDescription) {
        this.proDescription = proDescription;
    }

    public String getProTitle() {
        return proTitle;
    }

    public void setProTitle(String proTitle) {
        this.proTitle = proTitle;
    }

    @Override
    public String toString() {
        return "Product{" + "proId=" + proId + ", proName=" + proName + ", proImage=" + proImage + ", proPrice=" + proPrice + ", proDescription=" + proDescription + ", proTitle=" + proTitle + '}';
    }
    
    

}