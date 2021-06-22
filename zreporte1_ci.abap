*&---------------------------------------------------------------------*
*& Include          ZREPORTE1_CI
*&---------------------------------------------------------------------*
* Class Implementation for ZREPORTE1
*&-----------------------------------------------------------------------&*

*&-----------------------------------------------------------------------&*
DATA go_reporte1  TYPE REF TO lcl_reporte1.
CLASS lcl_reporte1 IMPLEMENTATION.

  METHOD get_data.

    SELECT scarr~carrid, scarr~carrname, scarr~currcode,
    spfli~connid, spfli~countryfr, spfli~cityfrom, spfli~countryto, spfli~cityto,
            sflight~fldate, sflight~price, sflight~planetype, sflight~seatsmax, sflight~seatsocc,
      sbook~bookid, sbook~customid, sbook~custtype, sbook~smoker, sbook~luggweight
      FROM scarr
      INNER JOIN spfli ON spfli~carrid = scarr~carrid
    INNER JOIN sflight ON sflight~carrid = spfli~carrid
      AND sflight~connid = spfli~connid
    INNER JOIN sbook ON sbook~carrid = sflight~carrid
      AND sbook~connid = sflight~connid
      AND sbook~fldate = sflight~fldate
      WHERE carrname = @p_name
      INTO TABLE @DATA(lt_join).

    gt_alv = lt_join.

  ENDMETHOD.

  METHOD mostrar_alv.

*Declaraciones de tipos, estructuras y tablas propias del ALV

    TYPE-POOLS: slis.

*Tabla y estructura del catalogo
    DATA: ti_catalogo TYPE slis_t_fieldcat_alv,
          st_catalogo TYPE slis_fieldcat_alv,
*Estructura para la configuracion de la salida
          st_layout   TYPE slis_layout_alv,
*Variable con el nombre del programa
          v_repid     LIKE sy-repid.

*Armado del catalogo del ALV --------------------- ABAP 740 ----------------------------

    ti_catalogo = VALUE #( ( fieldname = 'Carrid' seltext_l = 'Carrid' outputlen = '15' )
    ( fieldname = 'Carrname' seltext_l = 'Carrname' outputlen = '15' )
    ( fieldname = 'Currcode' seltext_l = 'Currcode' outputlen = '15' )
    ( fieldname = 'Connid' seltext_l = 'Connid' outputlen = '15' )
    ( fieldname = 'Countryfr' seltext_l = 'Countryfr' outputlen = '15' )
    ( fieldname = 'Cityfrom' seltext_l = 'Cityfrom' outputlen = '15' )
    ( fieldname = 'Countryto' seltext_l = 'Countryto' outputlen = '15' )
    ( fieldname = 'Cityto' seltext_l = 'Cityto' outputlen = '15' )
    ( fieldname = 'Fldate' seltext_l = 'Fldate' outputlen = '15' )
    ( fieldname = 'Price' seltext_l = 'Price' outputlen = '15' )
    ( fieldname = 'Planetype' seltext_l = 'Planetype' outputlen = '15' )
    ( fieldname = 'Seatsmax' seltext_l = 'Seatsmax' outputlen = '15' )
    ( fieldname = 'Seatsocc' seltext_l = 'Seatsocc' outputlen = '15' )
    ( fieldname = 'Bookid' seltext_l = 'Bookid' outputlen = '15' )
    ( fieldname = 'Customid' seltext_l = 'Customid' outputlen = '15' )
    ( fieldname = 'Custtype' seltext_l = 'Custtype' outputlen = '15' )
    ( fieldname = 'Smoker' seltext_l = 'Smoker' outputlen = '15' )
    ( fieldname = 'Luggweight' seltext_l = 'Luggweight' outputlen = '15' ) ).

*Configuracion de la salida del ALV
    CLEAR st_layout.
    st_layout-zebra = abap_true. "Rayado de lineas
    st_layout-colwidth_optimize = abap_true.


*Ejecucion de la funcion del ALV

    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
      EXPORTING
        i_callback_program = sy-repid
        is_layout          = st_layout "slis_layout_alv
        it_fieldcat        = ti_catalogo "slis_t_fieldcat_alv
      TABLES
        t_outtab           = gt_alv
      EXCEPTIONS
        program_error      = 1
        OTHERS             = 2.
    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.

  ENDMETHOD.


ENDCLASS.
