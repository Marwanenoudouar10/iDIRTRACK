package myapp.example.demo.Entity;

import jakarta.persistence.*;
import lombok.Data;
import java.util.LinkedList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Data
@Table(name = "location")
public class Location {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToMany(mappedBy = "locationEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonManagedReference
    private List<Vehicle> myCars = new LinkedList<>();

    private String password;
    private String username;

    public List<Vehicle> getCars() {
        return myCars;
    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}