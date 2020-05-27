* Demo example for CDS test framework with multiple CDS under test
CLASS ltc_demo_mul_targets DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    CLASS-DATA:
      environment        TYPE REF TO if_cds_test_environment.
    CLASS-METHODS:
      class_setup
        RAISING
          cx_static_check ,
      class_teardown.


    DATA:
      act_results       TYPE STANDARD TABLE OF Z_CDS_V2_3 WITH EMPTY KEY,
      sales_order_items TYPE STANDARD TABLE OF Z_CDS_V2_2 WITH EMPTY KEY,
      act_result_1      TYPE STANDARD TABLE OF z_cds_v2_2,
      act_result_2      TYPE STANDARD TABLE OF z_cds_v2_1,
      act_result_3      TYPE  STANDARD TABLE OF z_pv_1,
        i_param_vals TYPE  if_cds_parameter_values_config=>ty_parameter_value_pairs.
*      sales_order_items_1 TYPE STANDARD TABLE OF Z_PV_1 WITH EMPTY KEY.



    METHODS:
      setup RAISING cx_static_check,
      test_cdsfrwk_open_so_items_eur FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltc_demo_mul_targets IMPLEMENTATION.

  METHOD class_setup.

 environment = cl_cds_test_environment=>create( i_for_entity = 'Z_CDS_V2_3' ).

  ENDMETHOD.

  METHOD class_teardown.
    environment->destroy( ).
  ENDMETHOD.

  METHOD setup.
    environment->clear_doubles( ).
  ENDMETHOD.

  METHOD test_cdsfrwk_open_so_items_eur.
    sales_order_items = VALUE #(
    ( carrid = 'AA' connid = 'CO_A' fldate = '20200101' )
    ( carrid = 'AB' connid = 'CO_B' fldate = '20200101' )
    ( carrid = 'AC' connid = 'CO_C' fldate = '20200102' )
    ( carrid = 'AD' connid = 'CO_D' fldate = '20200101' )
    ( carrid = 'AE' connid = 'CO_E' fldate = '20200103' )
    ( carrid = 'AF' connid = 'CO_F' fldate = '20200101' )
    ).
     i_param_vals = VALUE #( ( parameter_name = 'pCId' parameter_value = 'AA' ) ).
     environment->insert_test_data( i_data = sales_order_items i_parameter_values = i_param_vals ).
      sales_order_items = VALUE #(
    ( carrid = 'AG' connid = 'CO_A' fldate = '20200101' )
    ( carrid = 'AH' connid = 'CO_B' fldate = '20200101' )
    ( carrid = 'AI' connid = 'CO_C' fldate = '20200102' )
    ( carrid = 'AJ' connid = 'CO_D' fldate = '20200101' )
    ( carrid = 'AK' connid = 'CO_E' fldate = '20200103' )
    ( carrid = 'AL' connid = 'CO_F' fldate = '20200101' )
    ).
     i_param_vals = VALUE #( ( parameter_name = 'pCId' parameter_value = 'AB' ) ).
    environment->insert_test_data( i_data = sales_order_items i_parameter_values = i_param_vals ).
*
*    "Test
    SELECT * FROM z_cds_v2_3( pcid2 = 'AB' ) INTO TABLE @DATA(act_results).
    environment->enable_double_redirection(  ).
    SELECT * FROM Z_CDS_V2_2( pcid = 'AA' ) INTO TABLE @DATA(act_result_1).

  ENDMETHOD.

ENDCLASS.
