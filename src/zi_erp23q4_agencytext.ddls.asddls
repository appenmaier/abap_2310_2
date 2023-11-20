@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text for Agency'
define view entity ZI_ERP23Q4_AgencyText
  as select from /dmo/agency
{
  key agency_id             as AgencyId,
      
      /* Transient Data */
      concat(concat(concat_with_space(name, '(', 1), city), ')') as AgencyName // Name (City)
}
