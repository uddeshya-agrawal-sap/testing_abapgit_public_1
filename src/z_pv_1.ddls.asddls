define root view entity Z_PV_1
  as projection on Z_CDS_V1_1
{
      //Z_CDS_V2_1
  key carrid,
  key connid,
  key fldate
}
where fldate = '20200101'
