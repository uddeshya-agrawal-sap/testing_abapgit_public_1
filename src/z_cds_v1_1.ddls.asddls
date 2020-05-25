@AbapCatalog.sqlViewName: 'Z_SQL_V1_1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Test CDS V2 in steampunk'
define root view Z_CDS_V1_1
  as select from zud_table_1
{
      //zud_table_1
  key carrid,
  key connid,
  key fldate
}
