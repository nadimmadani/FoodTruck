package finalProject.domain;

import javax.persistence.*;

/**
 * Created by ryanmada1 on 6/27/2016.
 */
@Entity
public class Truck {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "TruckId")
    private Integer id;

    @Version
    private Integer version;

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Menu truckMenu;

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Location truckLocation;

    private String truckName;
    private String truckDescription;
    private String isRunning;

    public Truck() {}

    public Truck(String truckName, String truckDescription, String isRunning) {
        this.truckName = truckName;
        this.truckDescription = truckDescription;
        this.isRunning = isRunning;
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

    public Menu getTruckMenu() {
        return truckMenu;
    }

    public void setTruckMenu(Menu truckMenu) {
        this.truckMenu = truckMenu;
    }

    public Location getTruckLocation() {
        return truckLocation;
    }

    public void setTruckLocation(Location truckLocation) {
        this.truckLocation = truckLocation;
    }

    public String getTruckName() {
        return truckName;
    }

    public void setTruckName(String truckName) {
        this.truckName = truckName;
    }

    public String getTruckDescription() {
        return truckDescription;
    }

    public void setTruckDescription(String truckDescription) {
        this.truckDescription = truckDescription;
    }

    public String getIsRunning() {
        return isRunning;
    }

    public void setIsRunning(String isRunning) {
        this.isRunning = isRunning;
    }
}
