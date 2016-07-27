package finalProject.domain;

import finalProject.services.UserDetails;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Created by ryanmada1 on 6/27/2016.
 */
@Entity
public class Owner {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "OwnerId")
    private Integer id;

    @Version
    private Integer version;

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private OwnerContact ownerContact;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Truck> truckList;

    private String userName;

    private String password;


    public  Owner() {
        this.truckList = new ArrayList<>();
    }

    public Owner(String userName, String password) {
        this();
        this.setUserName(userName);
        this.setPassword(password);
    }


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

    public List<Truck> getTruckList() {
        return truckList;
    }

    public void setTruckList(List<Truck> truckList) {
        this.truckList = truckList;
    }

    public OwnerContact getOwnerContact() {
        return ownerContact;
    }

    public void setOwnerContact(OwnerContact ownerContact) {
        this.ownerContact = ownerContact;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

}
