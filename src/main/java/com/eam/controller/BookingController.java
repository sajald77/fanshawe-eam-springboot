package com.eam.controller;

import com.eam.model.Booking;
import com.eam.model.Event;
import com.eam.model.User;
import com.eam.repository.BookingRepository;
import com.eam.repository.EventRepository;
import com.eam.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/bookings")
public class BookingController {


        // private final EventRepository eventRepository;
    // private final VendorRepository vendorRepository;
    private final BookingRepository bookingRepository;
    private final UserRepository userRepository;

    public BookingController(
            // VendorRepository vendorRepository,
            // EventRepository eventRepository
    BookingRepository bookingRepository,
    UserRepository userRepository
    ) {
        // this.vendorRepository = vendorRepository;
        // this.eventRepository = eventRepository;
        this.bookingRepository = bookingRepository;
        this.userRepository = userRepository;
    }

    @GetMapping("/{id}")
    public ResponseEntity<List<Booking>> getUserById(@PathVariable Long id) {

        try {
            //get user from id
            User user = userRepository.findByUserId(id);    

            List<Booking> bookingsByuser = bookingRepository.findByUser(user);

            return ResponseEntity.ok(bookingsByuser);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }

    }

}