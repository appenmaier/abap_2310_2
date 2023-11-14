@EndUserText.label: 'Booking'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_ERP23Q4_Booking
  as projection on ZR_ERP23Q4_Booking
{
  key BookingUuid,
      TravelUuid,
      BookingId,
      BookingDate,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      
      /* Associations */
      _Travel : redirected to parent ZC_ERP23Q4_Travel
}
