package finalProject.domain;

import javax.persistence.*;

/**
 * Created by ryanmada1 on 6/27/2016.
 */
@Entity
public class Location {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "LocationId")
    private Integer id;

    @Version
    private Integer version;

    private String locationName;
    private String locationDescription;
    private String coordinates;
    private String locationAddress;
    private String locationAddressTwo;
    private String city;
    private String state;
    private String zip;


}
