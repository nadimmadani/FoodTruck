package finalProject.domain;

import javax.persistence.*;
import java.util.List;

/**
 * Created by ryanmada1 on 6/27/2016.
 */
@Entity
public class Menu {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "MenuId")
    private Integer id;

    @Version
    private Integer version;

    private String uploadedMenu;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public String getUploadedMenu() {
        return uploadedMenu;
    }

    public void setUploadedMenu(String uploadedMenu) {
        this.uploadedMenu = uploadedMenu;
    }
}
