package myapp.example.demo.services;

import myapp.example.demo.Entity.Document;
import myapp.example.demo.Entity.Vehicle;
import myapp.example.demo.Repository.DocumentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public class DocumentService {

    @Autowired
    private DocumentRepository documentRepository;

    public Document saveDocument(MultipartFile backFile, MultipartFile frontFile, String type, Vehicle vehicle) throws IOException {
        byte[] backBytes = backFile.getBytes();
        byte[] frontBytes = frontFile.getBytes();

        Document document = new Document();
        document.setType(type);
        document.setBackDocument(backBytes);
        document.setFrontDocument(frontBytes);
        document.setVehicle(vehicle);

        return documentRepository.save(document);
    }

    public List<Document> getDocumentsByVehicleId(Long vehicleId) {
        return documentRepository.findByVehicleId(vehicleId);
    }
}
