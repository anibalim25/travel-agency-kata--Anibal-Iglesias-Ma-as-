package com.breadhardit.travelagencykata.infrastructure.rest.dto;

import java.time.LocalDate;
import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class GetCustomerDTO {
  String id;
  String name;
  String surnames;
  LocalDate birthDate;
  String passportNumber;
}
