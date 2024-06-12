package myapp.example.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myapp.example.demo.Entity.Vehicle;
import myapp.example.demo.Repository.VehicleRepository;

import java.util.List;

@Service
public class VehicleService {

    @Autowired
    private VehicleRepository vehicleRepository;

    public List<Vehicle> getAllVehicles() {
        return vehicleRepository.findAll();
    }

    public Vehicle createVehicle(Vehicle vehicle) {
        return vehicleRepository.save(vehicle);
    }

    public Vehicle getVehicleById(Long id) {
        return vehicleRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Vehicle not found"));
    }

    public void deleteVehicle(Long id) {
        vehicleRepository.deleteById(id);
    }

    public List<Vehicle> getVehiclesByLocationId(Long locationId) {
        return vehicleRepository.findByLocationEntityId(locationId);
    }
}
