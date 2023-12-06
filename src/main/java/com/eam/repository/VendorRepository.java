package com.eam.repository;


import com.eam.model.Vendor;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;


public interface VendorRepository extends JpaRepository<Vendor, Long> {
    List<Vendor> findByVendorType(String vendorType);
}
