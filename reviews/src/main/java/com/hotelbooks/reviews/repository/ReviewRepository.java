package com.hotelbooks.reviews.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.hotelbooks.reviews.entity.ReviewEntity;

@Repository
public interface ReviewRepository extends JpaRepository<ReviewEntity, Long>{
	
	@Query(value="CALL GetAverageRatingByHotel(?1)", nativeQuery = true)
	List<Object []> findAverageRatingsByHotel(@Param("hotelIds") String hotelIds);
}
