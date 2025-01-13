package com.hotelsbook.services.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hotelsbook.services.DTO.HotelServicesDTO;
import com.hotelsbook.services.model.ServiceResponse;
import com.hotelsbook.services.repository.HotelServiceRepository;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class HotelService {
	
	private static final Logger logger = LoggerFactory.getLogger(HotelService.class);

    private HotelServiceRepository repository;

    public List<HotelServicesDTO> getServicesByHotels(String hotelIds) {
        
    	logger.info(hotelIds);
        
        List<Object[]> results = repository.getServicesByHotels(hotelIds);

        Map<Long, HotelServicesDTO> hotelServicesMap = new LinkedHashMap<>();
        
        for (Object[] row : results) {
            Long hotelId = ((Number) row[0]).longValue();
            String hotelName = (String) row[1];
            String serviceName = (String) row[2];
            Long serviceId = ((Number) row[3]).longValue();

            HotelServicesDTO hotelServicesDTO = hotelServicesMap.getOrDefault(hotelId, 
                new HotelServicesDTO(hotelId, hotelName, new ArrayList<>()));

            hotelServicesDTO.getServices().add(new ServiceResponse(serviceId, serviceName));
            hotelServicesMap.put(hotelId, hotelServicesDTO);
        }

        return new ArrayList<>(hotelServicesMap.values());
    }
}
