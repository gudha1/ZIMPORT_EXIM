class ZCL_IMPORT_EXIM_MAINTAIN_LIC definition
  public
  create public .

public section.

CLASS-DATA : BEGIN OF ZSTR,
  CreateLicenseType                           TYPE STRING ,
  CreateLicenseRefNo                          TYPE STRING,
  CreateCompantCode              TYPE STRING,
  CreateFileNo                  TYPE STRING,
  CreateLicenseDate             TYPE STRING,
  CreateCreatedBy               TYPE STRING,
  CreatePlant                   TYPE STRING,
  CreateissuingOfficer          TYPE STRING,
  CreateExtLicNo              TYPE STRING,
  CreateImportValidFrom     TYPE STRING,
  CreateImportValidTo     TYPE STRING,
  CreateExportValidFrom     TYPE STRING,
  CreateExportValidTo     TYPE STRING,
  CreateLicenseValueINR     TYPE STRING,
  CreateLicenseValueUSD     TYPE STRING,
  CreateLicenseValueFC     TYPE STRING,
  CreateImportDtyTol     TYPE STRING,
  CreatePlaDutySave      TYPE STRING,
  CreateExpOblINR        TYPE STRING,
  CreateExpOblUSD        TYPE STRING,
  CreateExpOblFC         TYPE STRING,
  CreateTotEcpQty        TYPE STRING,
  CreateExRateUSD        TYPE STRING,
  CreateExRateFC         TYPE STRING,
  CreateMaxObQty         TYPE STRING,
  CreateMaxObAmt         TYPE STRING,
  CreateLicSta           TYPE STRING,
  CreateStatusDate       TYPE STRING,
  ChangeBy               TYPE STRING,
  CreateTotEcportpQty    TYPE STRING,
  CreateRemark           TYPE STRING,
  CreExchRateUSD         TYPE STRING,
  CreExchRateFC          TYPE STRING,
  CreMaxObQty            TYPE STRING,
  CreMaxObAmt            TYPE STRING,
SIONNo                 TYPE STRING,
ObligationPermitted      TYPE STRING,
YieldReportWaiting       TYPE STRING,
AppliedEODC              TYPE STRING,
EODCReceived             TYPE STRING,
BondCancel               TYPE STRING,
YieldFromSpiceBoard      TYPE STRING,
CreatePortOfReg                        TYPE STRING,
CreateTotImpQty                        TYPE STRING,
CreateExchRateUSD                      TYPE STRING,
CreateExchRateFC                       TYPE STRING,
CreateActualDutyINR                    TYPE STRING,
CreateRemDutyINR                       TYPE STRING,
  END OF ZSTR.

  DATA : it_data LIKE ZSTR.

  interfaces IF_HTTP_SERVICE_EXTENSION .
protected section.
private section.
ENDCLASS.



CLASS ZCL_IMPORT_EXIM_MAINTAIN_LIC IMPLEMENTATION.


  method IF_HTTP_SERVICE_EXTENSION~HANDLE_REQUEST.

   DATA(body)  = request->get_text(  ).
   DATA(req) = request->get_form_fields(  ).
   xco_cp_json=>data->from_string( body )->write_to( REF #(  it_data ) ).
   DATA(type) = value #( req[ name = 'type' ]-value optional ) .

  IF type <> 'Change' .

   DATA wa_head type zim_maintain_lic.
   DATA responce TYPE string.

    DATA: nr_number     TYPE cl_numberrange_runtime=>nr_number.
    TRY.
        CALL METHOD cl_numberrange_runtime=>number_get
          EXPORTING
            nr_range_nr = '01'
            object      = 'ZLIC_REF'
            quantity    = 0000000001
          IMPORTING
            number      = nr_number.

      CATCH cx_nr_object_not_found.
      CATCH cx_number_ranges.
    ENDTRY.
SHIFT nr_number LEFT DELETING LEADING '0'.
DATA NUMBERRANE TYPE C LENGTH 10 .

NUMBERRANE = nr_number .
CONDENSE NUMBERRANE NO-GAPS.

wa_head-compantcode            =  it_data-createcompantcode  .
wa_head-createdby  =                                      it_data-createcreatedby  .
wa_head-exchratefc  =                                     it_data-createexratefc  .
wa_head-exchrateusd  =                                    it_data-createexrateusd  .
wa_head-expoblfc  =                                       it_data-createexpoblfc  .
wa_head-expoblinr  =                                      it_data-createexpoblinr  .
wa_head-expoblusd  =                                      it_data-createexpoblusd  .
wa_head-exportmaxobamt  =                                 it_data-createmaxobamt  .
wa_head-exportmaxobqty  =                                 it_data-createmaxobqty  .

IF it_data-createexportvalidfrom  IS NOT INITIAL .
wa_head-exportvalidfrom  =                                it_data-createexportvalidfrom+6(4) && it_data-createexportvalidfrom+3(2) && it_data-createexportvalidfrom+0(2)  .
ENDIF.

IF it_data-createexportvalidto  IS NOT INITIAL .
wa_head-exportvalidto  =                                  it_data-createexportvalidto+6(4) && it_data-createexportvalidto+3(2) && it_data-createexportvalidto+0(2)  .
ENDIF.

wa_head-exratefc  =                                       it_data-createexratefc  .
wa_head-exrateusd  =                                      it_data-createexrateusd  .
wa_head-extlicno  =                                       it_data-createextlicno  .
wa_head-fileno  =                                         it_data-createfileno  .
wa_head-importdtytoal  =                                  it_data-CreateImportDtyTol  .
IF it_data-createimportvalidfrom  IS NOT INITIAL.
wa_head-importvalidfrom  =                                it_data-createimportvalidfrom+6(4) && it_data-createimportvalidfrom+3(2) && it_data-createimportvalidfrom+0(2)  .
ENDIF.
IF  it_data-createimportvalidto  IS NOT INITIAL .
wa_head-importvalidto  =                                  it_data-createimportvalidto+6(4) && it_data-createimportvalidto+3(2) && it_data-createimportvalidto+0(2)  .
ENDIF.
wa_head-issuingofficer  =                                 it_data-createissuingofficer  .

IF    it_data-createlicensedate  IS NOT INITIAL .
wa_head-licensedate  =                                    it_data-createlicensedate+6(4) && it_data-createlicensedate+3(2) && it_data-createlicensedate+0(2)   .
ENDIF.
wa_head-licenserefno  =                                   NUMBERRANE  .
wa_head-licensetype  =                                    it_data-createlicensetype  .
wa_head-licensevaluefc  =                                 it_data-createlicensevaluefc  .
wa_head-licensevalueinr  =                                it_data-createlicensevalueinr  .
wa_head-licensevalueusd  =                                it_data-createlicensevalueusd  .
wa_head-licsta  =                                         it_data-createlicsta  .
wa_head-pladutysave  =                                    it_data-createpladutysave  .
wa_head-plant  =                                          it_data-createplant  .
wa_head-remark  =                                         it_data-createremark  .

wa_head-changeby  =                                        it_data-ChangeBy.

IF    it_data-createstatusdate IS NOT INITIAL.
wa_head-statusdate  =                                     it_data-createstatusdate+6(4) && it_data-createstatusdate+3(2) && it_data-createstatusdate+0(2)  .
ENDIF.
wa_head-statusmaxobamt  =                                 it_data-cremaxobamt  .
wa_head-statusmaxobqty  =                                 it_data-cremaxobqty  .
wa_head-totecportpqty  =                                  it_data-createtotecportpqty  .
wa_head-totecpqty  =                                      it_data-createtotecpqty  .

wa_head-SIONNo                                   =     it_data-SIONNo                .
wa_head-ObligationPermitted                      =     it_data-ObligationPermitted   .
wa_head-YieldReportWaiting                       =     it_data-YieldReportWaiting    .
wa_head-AppliedEODC                              =     it_data-AppliedEODC           .
wa_head-EODCReceived                             =     it_data-EODCReceived          .
wa_head-BondCancel                               =     it_data-BondCancel            .
wa_head-YieldFromSpiceBoard                      =     it_data-YieldFromSpiceBoard   .
wa_head-createportofreg                         = it_data-CreatePortOfReg                  .
wa_head-totimpqty                               = it_data-CreateTotImpQty                  .
wa_head-impexchrateusd                          = it_data-CreateExchRateUSD                .
wa_head-impexchratefc                           = it_data-CreateExchRateFC                 .
wa_head-actualdutyinr                           = it_data-CreateActualDutyINR              .
wa_head-remdutyinr                              = it_data-CreateRemDutyINR                 .


MODIFY zim_maintain_lic FROM @wa_head.
responce = |Data saved successfully.{ NUMBERRANE }|.


***************************************************************************change****************************************************

ELSEIF TYPE = 'Change'.

wa_head-compantcode            =  it_data-createcompantcode  .
wa_head-createdby  =                                      it_data-createcreatedby  .
wa_head-exchratefc  =                                     it_data-createexratefc  .
wa_head-exchrateusd  =                                    it_data-createexrateusd  .
wa_head-expoblfc  =                                       it_data-createexpoblfc  .
wa_head-expoblinr  =                                      it_data-createexpoblinr  .
wa_head-expoblusd  =                                      it_data-createexpoblusd  .
wa_head-exportmaxobamt  =                                 it_data-createmaxobamt  .
wa_head-exportmaxobqty  =                                 it_data-createmaxobqty  .

IF it_data-createexportvalidfrom  IS NOT INITIAL .
wa_head-exportvalidfrom  =                                it_data-createexportvalidfrom+6(4) && it_data-createexportvalidfrom+3(2) && it_data-createexportvalidfrom+0(2)  .
ENDIF.

IF it_data-createexportvalidto  IS NOT INITIAL .
wa_head-exportvalidto  =                                  it_data-createexportvalidto+6(4) && it_data-createexportvalidto+3(2) && it_data-createexportvalidto+0(2)  .
ENDIF.

wa_head-exratefc  =                                       it_data-creexchratefc  .
wa_head-exrateusd  =                                      it_data-creexchrateusd  .
wa_head-extlicno  =                                       it_data-createextlicno  .
wa_head-fileno  =                                         it_data-createfileno  .
wa_head-importdtytoal  =                                  it_data-CreateImportDtyTol  .
IF it_data-createimportvalidfrom  IS NOT INITIAL.
wa_head-importvalidfrom  =                                it_data-createimportvalidfrom+6(4) && it_data-createimportvalidfrom+3(2) && it_data-createimportvalidfrom+0(2)  .
ENDIF.
IF  it_data-createimportvalidto  IS NOT INITIAL .
wa_head-importvalidto  =                                  it_data-createimportvalidto+6(4) && it_data-createimportvalidto+3(2) && it_data-createimportvalidto+0(2)  .
ENDIF.
wa_head-issuingofficer  =                                 it_data-createissuingofficer  .

IF    it_data-createlicensedate  IS NOT INITIAL .
wa_head-licensedate  =                                    it_data-createlicensedate+6(4) && it_data-createlicensedate+3(2) && it_data-createlicensedate+0(2)   .
ENDIF.
wa_head-licenserefno  =                                   it_data-CreateLicenseRefNo  .
wa_head-licensetype  =                                    it_data-createlicensetype  .
wa_head-licensevaluefc  =                                 it_data-createlicensevaluefc  .
wa_head-licensevalueinr  =                                it_data-createlicensevalueinr  .
wa_head-licensevalueusd  =                                it_data-createlicensevalueusd  .
wa_head-licsta  =                                         it_data-createlicsta  .
wa_head-pladutysave  =                                    it_data-createpladutysave  .
wa_head-plant  =                                          it_data-createplant  .
wa_head-remark  =                                         it_data-createremark  .

wa_head-changeby  =                                        it_data-ChangeBy.

IF    it_data-createstatusdate IS NOT INITIAL.
wa_head-statusdate  =                                     it_data-createstatusdate+6(4) && it_data-createstatusdate+3(2) && it_data-createstatusdate+0(2)  .
ENDIF.
wa_head-statusmaxobamt  =                                 it_data-cremaxobamt  .
wa_head-statusmaxobqty  =                                 it_data-cremaxobqty  .
wa_head-totecportpqty  =                                  it_data-createtotecportpqty  .
wa_head-totecpqty  =                                      it_data-createtotecpqty  .
wa_head-SIONNo                                   =     it_data-SIONNo                .
wa_head-ObligationPermitted                      =     it_data-ObligationPermitted   .
wa_head-YieldReportWaiting                       =     it_data-YieldReportWaiting    .
wa_head-AppliedEODC                              =     it_data-AppliedEODC           .
wa_head-EODCReceived                             =     it_data-EODCReceived          .
wa_head-BondCancel                               =     it_data-BondCancel            .
wa_head-YieldFromSpiceBoard                      =     it_data-YieldFromSpiceBoard   .
wa_head-createportofreg                         = it_data-CreatePortOfReg                  .
wa_head-totimpqty                               = it_data-CreateTotImpQty                  .
wa_head-impexchrateusd                          = it_data-CreateExchRateUSD                .
wa_head-impexchratefc                           = it_data-CreateExchRateFC                 .
wa_head-actualdutyinr                           = it_data-CreateActualDutyINR              .
wa_head-remdutyinr                              = it_data-CreateRemDutyINR                 .


MODIFY zim_maintain_lic FROM @wa_head.
responce = |Data Change successfully.{ it_data-CreateLicenseRefNo }|.

ENDIF.
    response->set_text( responce ).
  endmethod.
ENDCLASS.
