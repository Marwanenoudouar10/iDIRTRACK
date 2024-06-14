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
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import myapp.example.demo.Utils.JwtUtil;
import myapp.example.demo.services.LocationService;

@RestController
@RequestMapping("/api/locations/auth")
public class AuthController {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private UserDetailsService userDetailsService;

    @SuppressWarnings("unused")
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

        // Generate JWT token
        final String jwt = jwtUtil.generateToken(userDetails.getUsername());

        // Retrieve user ID (assuming UserDetails contains the user's ID)
        Long userId = locationService.getUserIdByUsername(authRequest.getUsername());

        // Create response payload with token and user ID
        AuthResponse authResponse = new AuthResponse(jwt, userId);
        return ResponseEntity.ok(authResponse);

    } catch (Exception e) {
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid username or password");
    }
}
@PostMapping("/register")
public ResponseEntity<?> register(@RequestBody AuthRequest authRequest) {
    String username = authRequest.getUsername();
    if (locationService.getUserIdByUsername(username) != null) {
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
        SecurityContextLogoutHandler logoutHandler = new SecurityContextLogoutHandler();
        logoutHandler.logout(request, response, SecurityContextHolder.getContext().getAuthentication());
    }
}
