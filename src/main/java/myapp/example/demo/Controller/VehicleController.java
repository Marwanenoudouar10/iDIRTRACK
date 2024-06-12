package myapp.example.demo.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import myapp.example.demo.Entity.Vehicle;
import myapp.example.demo.services.VehicleService;

import java.util.List;

@RestController
@RequestMapping("/api")
public class VehicleController {

    @Autowired
    private VehicleService vehicleService;

    @GetMapping("/vehicles")
    public ResponseEntity<List<Vehicle>> getAllVehicles() {
        List<Vehicle> vehicles = vehicleService.getAllVehicles();
        return new ResponseEntity<>(vehicles, HttpStatus.OK);
    }

    @GetMapping("/locations/{locationId}/vehicles")
    public ResponseEntity<List<Vehicle>> getVehiclesByLocationId(@PathVariable Long locationId) {
        List<Vehicle> vehicles = vehicleService.getVehiclesByLocationId(locationId);
        return new ResponseEntity<>(vehicles, HttpStatus.OK);
    }

    @PostMapping("/vehicles")
    public ResponseEntity<Vehicle> createVehicle(@RequestBody Vehicle vehicle) {
        Vehicle createdVehicle = vehicleService.createVehicle(vehicle);
        return new ResponseEntity<>(createdVehicle, HttpStatus.CREATED);
    }

    @GetMapping("/vehicles/{id}")
    public ResponseEntity<Vehicle> getVehicleById(@PathVariable Long id) {
        try {
            Vehicle vehicle = vehicleService.getVehicleById(id);
            return new ResponseEntity<>(vehicle, HttpStatus.OK);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/vehicles/{id}")
    public ResponseEntity<Void> deleteVehicle(@PathVariable Long id) {
        vehicleService.deleteVehicle(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
