*&---------------------------------------------------------------------*
*& Include          ZREPORTE1_GD
*&---------------------------------------------------------------------*
* Global Declarations for <Main Program_Name>
*&-----------------------------------------------------------------------&*

*&---------------------------------------------------------------------*
*& Include          ZREPORTE1_GD
*&---------------------------------------------------------------------*
* Global Declarations for ZREPORTE1
*&-----------------------------------------------------------------------&*

*&-----------------------------------------------------------------------&*
*   TABLES
*&-----------------------------------------------------------------------&*
TABLES scarr.

*&-----------------------------------------------------------------------&*
*   TYPES definition
*&-----------------------------------------------------------------------&*

TYPES: BEGIN OF ty_alv,
         carrid     TYPE s_carr_id,          "scarr
         carrname   TYPE s_carrname,       "scarr
         currcode   TYPE s_currcode,       "scarr
         connid     TYPE s_conn_id,          "spfli
         countryfr  TYPE land1,           "spfli
         cityfrom   TYPE s_from_cit,       "spfli
         countryto  TYPE land1,           "spfli
         cityto     TYPE s_to_city,          "spfli
         fldate     TYPE s_date,             "sflight
         price      TYPE s_price,             "sflight
         planetype  TYPE s_planetye,      "sflight
         seatsmax   TYPE s_seatsmax,       "sflight
         seatsocc   TYPE s_seatsocc,       "sflight
         bookid     TYPE s_book_id,          "sbook
         customid   TYPE s_customer,       "sbook
         custtype   TYPE s_custtype,       "sbook
         smoker     TYPE s_smoker,           "sbook
         luggweight TYPE s_lugweigh,     "sbook
       END OF ty_alv.

*&-----------------------------------------------------------------------&*
*   TYPES TABLES definition
*&-----------------------------------------------------------------------&*
TYPES: tt_alv  TYPE STANDARD TABLE OF ty_alv.

*&-----------------------------------------------------------------------&*
*   DATA declaration
*&-----------------------------------------------------------------------&*
DATA: gt_alv TYPE STANDARD TABLE OF ty_alv,
      wa_alv TYPE ty_alv.
