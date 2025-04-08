package com.breadhardit.travelagencykata.infrastructure.rest.dto;

import java.time.LocalDate;
import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class PutCustomerDTO {
  String name;
  String surnames;
  LocalDate birthDate;
  String passportNumber;
  Boolean active;
}
