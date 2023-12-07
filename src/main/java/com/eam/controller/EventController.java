package com.eam.controller;

import com.eam.model.Event;
import com.eam.model.Vendor;
import com.eam.repository.EventRepository;
import com.eam.repository.VendorRepository;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/events")
public class EventController {
    private final EventRepository eventRepository;
    private final VendorRepository vendorRepository;
    // private final BookingRepository bookingRepository;
    // private final UserRepository userRepository;

    public EventController(
            VendorRepository vendorRepository,
            EventRepository eventRepository
    // BookingRepository bookingRepository,
    // UserRepository userRepository
    ) {
        this.vendorRepository = vendorRepository;
        this.eventRepository = eventRepository;
        // this.bookingRepository = bookingRepository;
        // this.userRepository = userRepository;
    }

    @CrossOrigin
    @GetMapping("/{id}")
    public ResponseEntity<List<Event>> getEventByVendorId(@PathVariable Long id) {

        //get vendor from id

        try {

            Optional<Vendor> optionalVendor = vendorRepository.findById(id);

            //log the vendor

            Vendor vendor = optionalVendor.get();

            //log the vendor so that all the details is seen in the console
            System.out.println(vendor);


            List<Event> eventsByVendor = eventRepository.findByVendorVendorId(vendor.getVendorId());
            return ResponseEntity.ok(eventsByVendor);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
    }

}
