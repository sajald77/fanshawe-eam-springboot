package com.eam.controller;

import com.eam.model.Booking;
import com.eam.model.Event;
import com.eam.model.User;
import com.eam.model.Vendor;
import com.eam.repository.BookingRepository;
import com.eam.repository.EventRepository;
import com.eam.repository.UserRepository;
import com.eam.repository.VendorRepository;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/bookings")
public class BookingController {


        private final EventRepository eventRepository;
    private final VendorRepository vendorRepository;
    private final BookingRepository bookingRepository;
    private final UserRepository userRepository;

    public BookingController(
            VendorRepository vendorRepository,
            EventRepository eventRepository,
    BookingRepository bookingRepository,
    UserRepository userRepository
    ) {
        this.vendorRepository = vendorRepository;
        this.eventRepository = eventRepository;
        this.bookingRepository = bookingRepository;
        this.userRepository = userRepository;
    }
    @CrossOrigin
    @GetMapping("/{id}")
    public ResponseEntity<List<Booking>> getUserById(@PathVariable Long id) {

        try {
            //get user from id
            User user = userRepository.findByUserId(id);    

            List<Booking> bookingsByuser = bookingRepository.findByUserUserId(user.getUserId());

            return ResponseEntity.ok(bookingsByuser);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }

    }

    @CrossOrigin
    @PostMapping()
    public ResponseEntity<Booking> createBooking(@RequestBody Booking booking) {

        try {

            Optional<User> checkUser = userRepository.findById(booking.getUser().getUserId());
            if(!checkUser.isPresent()) {
                throw new Exception("user not found");
            }
            

            Optional<Event> checkEvent = eventRepository.findById(booking.getEvent().geteventId());

            if(!checkEvent.isPresent()) {
                throw new Exception("event not found");
            }

            Optional<Vendor> checkVendor = vendorRepository.findById(checkEvent.get().getVendor().getVendorId());

            if(!checkVendor.isPresent()) {
                throw new Exception("event not found");
            }

            booking.setUser(checkUser.get());
            booking.setEvent(checkEvent.get());
            booking.setVendor(checkVendor.get()); 
            booking.setInfo(checkEvent.get().getEventName());

            bookingRepository.save(booking);

            return ResponseEntity.ok(booking);

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }

    }

}