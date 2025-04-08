package com.breadhardit.travelagencykata.infrastructure.persistence.repository;

import com.breadhardit.travelagencykata.infrastructure.persistence.entity.CustomerEntity;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomersJPARepository extends JpaRepository<CustomerEntity, String> {

  Optional<CustomerEntity> findByPassportNumber(@Param("PASSPORT_NUMBER") String passportNumber);
}
