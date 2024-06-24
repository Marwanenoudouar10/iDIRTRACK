package myapp.example.demo.Controller;

import myapp.example.demo.Entity.Document;
import myapp.example.demo.Entity.Vehicle;
import myapp.example.demo.Repository.VehicleRepository;
import myapp.example.demo.services.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/api/documents")
public class DocumentController {

    @Autowired
    private DocumentService documentService;

    @Autowired
    private VehicleRepository vehicleRepository;

    @PostMapping("/locations/{locationId}/vehicles/{vehicleId}")
    public ResponseEntity<Document> uploadDocument(@PathVariable Long locationId,
                                                   @PathVariable Long vehicleId,
                                                   @RequestParam("backFile") MultipartFile backFile,
                                                   @RequestParam("frontFile") MultipartFile frontFile,
                                                   @RequestParam("type") String type) throws IOException {
        Vehicle vehicle = vehicleRepository.findById(vehicleId)
                .orElseThrow(() -> new RuntimeException("Vehicle not found"));

        Document document = documentService.saveDocument(backFile, frontFile, type, vehicle);
        return new ResponseEntity<>(document, HttpStatus.CREATED);
    }

    @GetMapping("/locations/{locationId}/vehicles/{vehicleId}")
    public ResponseEntity<List<Document>> getDocumentsByVehicleId(@PathVariable Long locationId, @PathVariable Long vehicleId) {
        List<Document> documents = documentService.getDocumentsByVehicleId(vehicleId);
        return new ResponseEntity<>(documents, HttpStatus.OK);
    }
}
