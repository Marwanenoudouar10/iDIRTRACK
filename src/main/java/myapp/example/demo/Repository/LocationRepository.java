package myapp.example.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import myapp.example.demo.Entity.Location;

import java.util.List;

public interface LocationRepository extends JpaRepository<Location, Long> {
    Location findByUsername(String username);

    List<Location> findAllByUsername(String currentPrincipalName);
}
