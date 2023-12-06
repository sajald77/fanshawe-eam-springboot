package com.eam.repository;

import com.eam.model.Event;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface EventRepository extends JpaRepository<Event, Long> {

    // // get all events by vendor id
    // List<Event> findByVendor(Vendor vendor);

    // get all events by vendor type
    public List<Event> findByVendorVendorId(Long vendorId);

}
