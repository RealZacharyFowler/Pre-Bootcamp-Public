package com.zac.pirateproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.zac.pirateproject.models.Pirate;
import com.zac.pirateproject.repositories.PirateRepository;

@Service
public class PirateService {
	
	@Autowired
	private PirateRepository repo;
	
	public PirateService (PirateRepository repo) {
		this.repo = repo;
	}
	public Pirate findById(Long id) {
		Optional<Pirate> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		
		return null;
	}
	public List<Pirate> all() {
		return repo.findAll();
	}
	
	public Pirate create(Pirate pirate) {
		return repo.save(pirate);
	}
	public void deletePirate(Pirate pirate) {
		repo.delete(pirate);
	}
	public Pirate updatePirate(Pirate pirate) {
		return repo.save(pirate);
	}

}
