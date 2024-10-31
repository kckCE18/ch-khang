package Models;

public class Category {
    private int cat_id;
    private String Cat_Name;

    public Category() {
    }

    public Category(int cat_id, String Cat_Name) {
        this.cat_id = cat_id;
        this.Cat_Name = Cat_Name;
    }

    public int getCat_id() {
        return cat_id;
    }

    public void setCat_id(int cat_id) {
        this.cat_id = cat_id;
    }

    public String getCat_Name() {
        return Cat_Name;
    }

    public void setCat_Name(String Cat_Name) {
        this.Cat_Name = Cat_Name;
    }

    @Override
    public String toString() {
        return "Category{" + "cat_id=" + cat_id + ", Cat_Name=" + Cat_Name + '}';
    }

  
}
