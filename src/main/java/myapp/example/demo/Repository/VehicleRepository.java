package myapp.example.demo.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import myapp.example.demo.Entity.Location;
import myapp.example.demo.Entity.Vehicle;

public interface VehicleRepository extends JpaRepository<Vehicle, Long> {

    List<Vehicle> findByLocationEntityId(Long locationId);

    void deleteAllByLocation(Location location);

}
