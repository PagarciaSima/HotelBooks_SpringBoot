package com.hotelsbook.services.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.hotelsbook.services.entity.HotelServiceEntity;

public interface HotelServiceRepository extends JpaRepository<HotelServiceEntity, Long>{

	@Query(value = "CALL GetServicesByHotels(:hotelIds)", nativeQuery = true)
    List<Object[]> getServicesByHotels(@Param("hotelIds") String hotelIds);
}
