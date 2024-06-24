package myapp.example.demo.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "document")
public class Document {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String type;

    @Lob
    @Column(name = "back_document", columnDefinition = "MEDIUMBLOB")
    private byte[] backDocument;

    @Lob
    @Column(name = "front_document", columnDefinition = "MEDIUMBLOB")
    private byte[] frontDocument; 

    @ManyToOne
    @JoinColumn(name = "vehicle_id", nullable = false)
    private Vehicle vehicle;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public byte[] getFrontDocument() {
        return frontDocument;
    }

    public void setFrontDocument(byte[] frontDocument) {
        this.frontDocument = frontDocument;
    }

    public byte[] getBackDocument() {
        return backDocument;
    }

    public void setBackDocument(byte[] backDocument) {
        this.backDocument = backDocument;
    }

    public Vehicle getVehicle() {
        return vehicle;
    }

    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
    }
}
