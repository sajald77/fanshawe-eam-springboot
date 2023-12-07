package com.eam.repository;

import com.eam.model.Booking;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface BookingRepository extends JpaRepository<Booking, Long> {
    // get all bookings by user id
    List<Booking> findByUserUserId(Long userId);
}