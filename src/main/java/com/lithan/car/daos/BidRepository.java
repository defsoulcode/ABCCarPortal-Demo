package com.lithan.car.daos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.lithan.car.entities.Car;
import com.lithan.car.entities.CarBidding;
import com.lithan.car.entities.Role;

import java.util.List;
import java.util.Set;


@Repository
public interface BidRepository extends JpaRepository<CarBidding, Long> {

	@Query( "select b from CarBidding b where b.car in :carid" )
	List<CarBidding> findByCarid(@Param("carid") Car car);
}
