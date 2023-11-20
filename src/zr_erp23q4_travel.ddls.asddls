@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel'
define root view entity ZR_ERP23Q4_Travel
  as select from zerp23q4_travel
  composition [0..*] of ZR_ERP23Q4_Booking    as _Bookings
  //travel as t left outer join booking as b on t.travel_uuid = b.travel_uuid
  association [1..1] to ZI_ERP23Q4_AgencyText as _AgencyText on $projection.AgencyId = _AgencyText.AgencyId
{
      @EndUserText: { label: 'Travel UUID', quickInfo: 'Travel UUID' }
  key travel_uuid     as TravelUuid,
      travel_id       as TravelId,
      @ObjectModel.text.element: [ 'AgencyName' ]
      agency_id       as AgencyId,
      customer_id     as CustomerId,
      begin_date      as BeginDate,
      end_date        as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee     as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price     as TotalPrice,
      currency_code   as CurrencyCode,
      description     as Description,
      status          as Status,
      created_by      as CreatedBy,
      created_at      as CreatedAt,
      last_changed_by as LastChangedBy,
      last_changed_at as LastChangedAt,

      /* Transient Data */
      _AgencyText.AgencyName,
      case when dats_days_between($session.system_date, begin_date) >= 14 then 3
           when dats_days_between($session.system_date, begin_date) >= 7 then 2
           when dats_days_between($session.system_date, begin_date) >= 0 then 1
           else 0
      end             as BeginDateCriticality,

      /* Associations */
      _Bookings
}
