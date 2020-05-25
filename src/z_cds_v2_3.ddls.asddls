define root view entity Z_CDS_V2_3
with parameters
   pcid2 : abap.char( 100 )
  as select from Z_CDS_V2_2(pCId : 'AA')
{
      //Z_CDS_V2_1
  key carrid,
  key connid,
  key fldate
}
where 
carrid = $parameters.pcid2
