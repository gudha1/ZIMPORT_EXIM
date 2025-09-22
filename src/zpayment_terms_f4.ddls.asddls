@AbapCatalog.sqlViewName: 'YPAYMENTRMS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds For Import Exim'
@Metadata.ignorePropagatedAnnotations: true
define view ZPAYMENT_TERMS_F4 as select from I_PaymentTermsText
{
    key PaymentTerms,
        case when PaymentTermsName is initial then PaymentTermsDescription else PaymentTermsName end as PaymentTermsName
}
where Language = 'E'
group by 
PaymentTerms,
PaymentTermsDescription,
PaymentTermsName
