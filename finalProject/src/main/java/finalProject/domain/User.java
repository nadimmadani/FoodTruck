package finalProject.domain;

import javax.persistence.*;

/**
 * Created by ryanmada1 on 6/27/2016.
 */
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "UserId")
    private Integer id;

    @Version
    private Integer version;

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private UserInfo userInformation;

    private String username;

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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
