@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Agency'
define view entity ZI_ERP23Q4_AgencyVH
  as select from /dmo/agency
{
  key agency_id    as AgencyId,
      name         as Name,
      street       as Street,
      postal_code  as PostalCode,
      city         as City,
      country_code as CountryCode
}
