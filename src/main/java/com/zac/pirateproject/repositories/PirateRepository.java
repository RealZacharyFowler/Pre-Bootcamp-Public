package com.zac.pirateproject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.zac.pirateproject.models.Pirate;



@Repository
public interface PirateRepository extends CrudRepository<Pirate, Long> {
	List<Pirate> findAll();

}
