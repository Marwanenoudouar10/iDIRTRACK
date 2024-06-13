package myapp.example.demo.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import myapp.example.demo.Entity.Location;
import myapp.example.demo.Entity.Vehicle;
import myapp.example.demo.services.LocationService;

import java.util.List;

@RestController
@RequestMapping("/api/locations")
public class LocationController {

    @Autowired
    private LocationService locationService;
    
    @GetMapping("/{locationId}")
    public ResponseEntity<Location> getLocationById(@PathVariable Long locationId) {
        Location location = locationService.getLocationById(locationId);
        return ResponseEntity.ok(location);
    }
    
    @GetMapping
    public List<Location> getAllLocations() {
        return locationService.getAllLocations();
    }

    @PostMapping
    public Location createLocation(@RequestBody Location location) {
        return locationService.createLocation(location);
    }

    @PostMapping("/{locationId}/vehicles")
    public Location addVehicleToLocation(@PathVariable Long locationId, @RequestBody Vehicle vehicle) {
        return locationService.addVehicleToLocation(locationId, vehicle);
    }
@DeleteMapping("/{locationId}")
    public ResponseEntity<?> deleteLocation(@PathVariable Long locationId) {
        try {
            locationService.deleteLocation(locationId);
            return ResponseEntity.noContent().build(); 
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error deleting location");
        }
    }
    @DeleteMapping("/{locationId}/vehicles/{vehicleId}")
    public void deleteVehicle(@PathVariable Long locationId, @PathVariable Long vehicleId) {
        locationService.deleteVehicle(locationId, vehicleId);
    }
}
