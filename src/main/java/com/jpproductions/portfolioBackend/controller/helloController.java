package com.jpproductions.portfolioBackend.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class helloController {

    @GetMapping("/hello")
    public String hello() {
        return "Hello from my Portfolio backend";
    }
}
