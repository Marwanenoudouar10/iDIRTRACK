package myapp.example.demo.Auth;

import lombok.extern.java.Log;

public class AuthResponse {
    private String jwt;
    private Long userId;

    // Constructor
    public AuthResponse(String jwt, Long userId) {
        this.userId = userId;
        this.jwt = jwt;
    }

    // Getter
    public String getJwt() {
        return jwt;
    }

    public void setJwt(String jwt) {
        this.jwt = jwt;
    }
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}
