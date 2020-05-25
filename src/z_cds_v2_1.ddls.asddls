
@EndUserText.label: 'Test CDS V2 in steampunk'
define root view entity Z_CDS_V2_1
  as select from Z_CDS_V1_1
{
      //Z_CDS_V1_1
  key carrid,
  key connid,
  key fldate
}
where carrid >= 'AA' and carrid < 'AE'
