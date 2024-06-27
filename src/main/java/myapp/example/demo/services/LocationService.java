package myapp.example.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import myapp.example.demo.Entity.Location;
import myapp.example.demo.Entity.Vehicle;
import myapp.example.demo.Repository.LocationRepository;
import myapp.example.demo.Repository.VehicleRepository;

import java.util.List;

@Service
public class LocationService {

    @Autowired
    private LocationRepository locationRepository;

    @Autowired VehicleRepository vehicleRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public Location getLocationById(Long locationId) {
        return locationRepository.findById(locationId)
                .orElseThrow(() -> new RuntimeException("Location not found"));
    }

    public boolean authenticate(String username, String password) {
        Location location = locationRepository.findByUsername(username);
        if (location != null && passwordEncoder.matches(password, location.getPassword())) {
            return true;
        } else {
            return false;
        }
    }

    public List<Location> getAllLocations() {
        return locationRepository.findAll();
    }

    public void registerUser(String username, String rawPassword) {
        String encodedPassword = passwordEncoder.encode(rawPassword);
        Location location = new Location();
        location.setUsername(username);
        location.setPassword(encodedPassword);
        locationRepository.save(location);
    }

    public Location createLocation(Location location) {
        return locationRepository.save(location);
    }

    public Location addVehicleToLocation(Long locationId, Vehicle vehicle) {
        Location location = locationRepository.findById(locationId)
                .orElseThrow(() -> new RuntimeException("Location not found"));
        vehicle.setLocationEntity(location);
        vehicleRepository.save(vehicle);
        location.getCars().add(vehicle);
        return locationRepository.save(location);
    }
    
    public void deleteLocation(Long locationId) {
        Location location = locationRepository.findById(locationId)
                .orElseThrow();
        location.getCars().clear(); 
        vehicleRepository.deleteAllByLocation(location);

        locationRepository.delete(location);
    }

    public void deleteVehicle(Long locationId, Long vehicleId) {
        Location location = locationRepository.findById(locationId)
                .orElseThrow(() -> new RuntimeException("Location not found"));
        boolean vehicleExists = location.getCars().stream().anyMatch(vehicle -> vehicle.getId().equals(vehicleId));
        if (!vehicleExists) {
            throw new RuntimeException("Vehicle not found!");
        }
        vehicleRepository.deleteById(vehicleId);
    }

    public Long getLocationIdByUsername(String username) {
        try {
            Location location = locationRepository.findByUsername(username);
            if (location != null) {
                return location.getId();
            } else {
                return null;
            }
        } catch (Exception e) {
            return null;
        }
    }
    public Location getLocationByUsername(String username) {
        return locationRepository.findByUsername(username);
    }

}
