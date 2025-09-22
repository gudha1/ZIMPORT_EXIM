@AbapCatalog.sqlViewName: 'YEXIMMAINLIC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds For Maintain Lic Import Exim'
@Metadata.ignorePropagatedAnnotations: true
define view ZIM_MAINTAIN_LIC_CDS as select from zim_maintain_lic
{
    key licenserefno as Licenserefno,
    licensetype as Licensetype,
    compantcode as Compantcode,
    fileno as Fileno,
    licensedate as Licensedate,
    createdby as Createdby,
    plant as Plant,
    issuingofficer as Issuingofficer,
    extlicno as Extlicno,
    importvalidfrom as Importvalidfrom,
    importvalidto as Importvalidto,
    exportvalidfrom as Exportvalidfrom,
    exportvalidto as Exportvalidto,
    licensevalueinr as Licensevalueinr,
    licensevalueusd as Licensevalueusd,
    licensevaluefc as Licensevaluefc,
    importdtytoal as Importdtytoal,
    pladutysave as Pladutysave,
    expoblinr as Expoblinr,
    expoblusd as Expoblusd,
    expoblfc as Expoblfc,
    totecpqty as Totecpqty,
    exrateusd as Exrateusd,
    exratefc as Exratefc,
    exportmaxobqty as Exportmaxobqty,
    exportmaxobamt as Exportmaxobamt,
    licsta as Licsta,
    statusdate as Statusdate,
    stadate as Stadate,
    totecportpqty as Totecportpqty,
    remark as Remark,
    exchrateusd as Exchrateusd,
    exchratefc as Exchratefc,
    statusmaxobqty as Statusmaxobqty,
    statusmaxobamt as Statusmaxobamt,
    sionno,
obligationpermitted,
yieldreportwaiting,
appliedeodc,
eodcreceived,
bondcancel,
yieldfromspiceboard,
 createportofreg  ,  
 totimpqty         , 
 impexchrateusd     ,
 impexchratefc    ,  
 actualdutyinr    ,  
 remdutyinr      ,
 changeby   

}
