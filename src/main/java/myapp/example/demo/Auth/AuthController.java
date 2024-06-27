package myapp.example.demo.Auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import myapp.example.demo.Entity.Location;
import myapp.example.demo.services.LocationService;

@RestController
@RequestMapping("/api/locations/auth")
public class AuthController {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private LocationService locationService;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody AuthRequest authRequest) {
        try {
            final UserDetails userDetails = userDetailsService.loadUserByUsername(authRequest.getUsername());
            UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(
                    userDetails.getUsername(), authRequest.getPassword());
            authenticationManager.authenticate(token);
            
            Location location = locationService.getLocationByUsername(authRequest.getUsername());
            if (location != null) {
                AuthResponse authResponse = new AuthResponse(location.getId(), location.getUsername(), location.getPassword());
                return ResponseEntity.ok(authResponse); // Return only the required fields
            } else {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Location not found");
            }

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid username or password");
        }
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody AuthRequest authRequest) {
        String username = authRequest.getUsername();
        if (locationService.getLocationIdByUsername(username) != null) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("Username already exists. Please choose a different username.");
        }

        try {
            String encodedPassword = passwordEncoder.encode(authRequest.getPassword());
            locationService.registerUser(username, encodedPassword);
            return ResponseEntity.ok("User registered successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("User registration failed");
        }
    }

    @PostMapping("/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) {
        SecurityContextHolder.getContext().setAuthentication(null); // Clear authentication
        SecurityContextHolder.clearContext(); // Clear security context
    }
}
