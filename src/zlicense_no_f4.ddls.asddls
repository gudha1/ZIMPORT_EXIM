@AbapCatalog.sqlViewName: 'YLICNCF4'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds For License F4'
@Metadata.ignorePropagatedAnnotations: true
define view ZLICENSE_NO_F4 as select from zim_maintain_lic
{
    key licenserefno as Licenserefno,
    key   extlicno  as Extlicno
}
group by 
licenserefno,
extlicno
