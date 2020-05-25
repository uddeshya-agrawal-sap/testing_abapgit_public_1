define root view entity Z_PV_2
  as projection on Z_CDS_V2_1
  association to Z_PV_1 as _assoc on _assoc.carrid = 'AA'
{
  //Z_CDS_V2_1
  key carrid,
  key connid,
  key fldate,
  _assoc
}
where carrid = 'AA' or carrid = 'AB'
