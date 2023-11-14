CLASS zcl_erp23q4_travel_generator DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_erp23q4_travel_generator IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA travels  TYPE TABLE OF zerp23q4_travel.  " List<Travel> travels = new ArrayList<>();
    DATA travel   TYPE zerp23q4_travel.           " Travel travel;
    DATA bookings TYPE TABLE OF zerp23q4_booking.
    DATA booking  TYPE zerp23q4_booking.

    " Reisen und Buchungen löschen
    DELETE FROM zerp23q4_travel.
    DELETE FROM zerp23q4_booking.

    " Reisen und Buchungen erstellen
    travel-agency_id   = '000008'.
    travel-begin_date  = '20231030'.
    travel-booking_fee = 20.
    travel-client      = sy-mandt.
    GET TIME STAMP FIELD travel-created_at.
    travel-created_by    = 'GENERATOR'.
    travel-currency_code = 'EUR'.
    travel-customer_id   = '000002'.
    travel-description   = 'Kurztrip nach Berlin'.
    travel-end_date      = '20231102'.
    GET TIME STAMP FIELD travel-last_changed_at.
    travel-last_changed_by = 'GENERATOR'.
    travel-status          = 'B'.
    travel-total_price     = 240.
    travel-travel_id       = '00000001'.
    travel-travel_uuid     = cl_system_uuid=>create_uuid_x16_static( ).
    APPEND travel TO travels. " travels.add(travel);

    booking-booking_date  = '20231020'.
    booking-booking_id    = '9620'.
    booking-booking_uuid  = cl_system_uuid=>create_uuid_x16_static( ).
    booking-carrier_id    = 'LH'.
    booking-client        = sy-mandt.
    booking-connection_id = '0300'.
    booking-currency_code = 'EUR'.
    booking-flight_date   = travel-begin_date.
    booking-flight_price  = '110'.
    booking-travel_uuid   = travel-travel_uuid.
    APPEND booking TO bookings.

    booking-booking_date  = '20231020'.
    booking-booking_id    = '3364'.
    booking-booking_uuid  = cl_system_uuid=>create_uuid_x16_static( ).
    booking-carrier_id    = 'LH'.
    booking-client        = sy-mandt.
    booking-connection_id = '0350'.
    booking-currency_code = 'EUR'.
    booking-flight_date   = travel-end_date.
    booking-flight_price  = '110'.
    booking-travel_uuid   = travel-travel_uuid.
    APPEND booking TO bookings.

    travel-agency_id   = '000044'.
    travel-begin_date  = '20220707'.
    travel-booking_fee = 50.
    travel-client      = sy-mandt.
    GET TIME STAMP FIELD travel-created_at.
    travel-created_by    = 'GENERATOR'.
    travel-currency_code = 'EUR'.
    travel-customer_id   = '000025'.
    travel-description   = 'Hamburg'.
    travel-end_date      = '20220716'.
    GET TIME STAMP FIELD travel-last_changed_at.
    travel-last_changed_by = 'GENERATOR'.
    travel-status          = 'B'.
    travel-total_price     = 678.
    travel-travel_id       = '00000002'.
    travel-travel_uuid     = cl_system_uuid=>create_uuid_x16_static( ).
    APPEND travel TO travels. " travels.add(travel);

    " Reisen und Buchungen hinzufügen
    INSERT zerp23q4_travel FROM TABLE @travels.
    INSERT zerp23q4_booking FROM TABLE @bookings.
  ENDMETHOD.
ENDCLASS.
