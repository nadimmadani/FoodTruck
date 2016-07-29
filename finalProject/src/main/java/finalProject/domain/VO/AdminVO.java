package finalProject.domain.VO;

import finalProject.domain.Location;
import finalProject.domain.Truck;

/**
 * Created by ryanmada1 on 6/29/2016.
 */
public class AdminVO {

    private String newTruckName;
    private String newTruckDescription;
    private String isTruckRunning;
    private String newUserName;
    private String newPassword;
    private String[] newTruckList;
    private Location truckLocation;
    private Truck newTruck;

    public Truck getNewTruck() {
        return newTruck;
    }

    public void setNewTruck(Truck newTruck) {
        this.newTruck = newTruck;
    }

    public String getNewUserName() {
        return newUserName;
    }

    public void setNewUserName(String newUserName) {
        this.newUserName = newUserName;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getNewTruckName() {
        return newTruckName;
    }

    public void setNewTruckName(String newTruckName) {
        this.newTruckName = newTruckName;
    }

    public String getNewTruckDescription() {
        return newTruckDescription;
    }

    public void setNewTruckDescription(String newTruckDescription) {
        this.newTruckDescription = newTruckDescription;
    }

    public String getIsTruckRunning() {
        return isTruckRunning;
    }

    public void setIsTruckRunning(String isTruckRunning) {
        this.isTruckRunning = isTruckRunning;
    }

    public String[] getNewTruckList() {
        return newTruckList;
    }

    public void setNewTruckList(String[] newTruckList) {
        this.newTruckList = newTruckList;
    }

    public Location getTruckLocation() {
        return truckLocation;
    }

    public void setTruckLocation(Location truckLocation) {
        this.truckLocation = truckLocation;
    }
}
