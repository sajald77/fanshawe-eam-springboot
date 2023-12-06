package com.eam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eam.model.Vendor;
import com.eam.repository.VendorRepository;

@RestController
@RequestMapping("/api/vendors")
public class VendorController {

    @Autowired
    private VendorRepository vendorRepository;

    @GetMapping("/{type}")
    public ResponseEntity<List<Vendor>> getAllVendorsByType(@PathVariable String type) {
        List<Vendor> vendors = vendorRepository.findByVendorType(type);
        if (vendors.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok().body(vendors);
        }
    }
}