package com.breadhardit.travelagencykata.domain;

import java.time.LocalDate;
import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class Customer {
  String id;
  String name;
  String surnames;
  LocalDate birthDate;
  String passportNumber;
  LocalDate enrollmentDate;
  Boolean active;
}
