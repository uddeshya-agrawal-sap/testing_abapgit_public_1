define root view entity Z_CDS_V2_2
with parameters
    pCId : abap.char( 100 )
  as select from Z_CDS_V2_1
{
      //Z_CDS_V2_1
  key carrid,
  key connid,
  key fldate
}
where 
carrid = $parameters.pCId
or fldate = '20200101'
