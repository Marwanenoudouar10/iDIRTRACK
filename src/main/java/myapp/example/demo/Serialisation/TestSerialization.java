package myapp.example.demo.Serialisation;

import com.fasterxml.jackson.databind.ObjectMapper;
import myapp.example.demo.Entity.Location;
import java.util.LinkedList;

public class TestSerialization {

    public static void main(String[] args) throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        
        Location location = new Location();
        location.setId(9L);
        location.setPassword("azdin");
        location.setUsername("123456");
        location.setMyCars(new LinkedList<>());

        String jsonResult = mapper.writeValueAsString(location);
        System.out.println(jsonResult);
    }
}
