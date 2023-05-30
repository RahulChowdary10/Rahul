CLASS y219_abap_git_week_3 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

    TYPES: BEGIN OF ts_record_list,
             name TYPE string,
             no   TYPE i,
           END OF ts_record_list,
           tty_record_list TYPE TABLE OF ts_record_list WITH DEFAULT KEY.

    TYPES: BEGIN OF ts_record,
             record_name TYPE string,
             record      TYPE tty_record_list,
           END OF ts_record.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS y219_abap_git_week_3 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lo_mustache_ref TYPE REF TO zcl_mustache.

    DATA: lt_record TYPE STANDARD TABLE OF ts_record WITH DEFAULT KEY,
          lr_ref    TYPE REF TO ts_record.

    APPEND INITIAL LINE TO lt_record REFERENCE INTO lr_ref.
    lr_ref->record_name = 'Goals'.
    lr_ref->record = VALUE #( (  name = 'Cristiano Ronaldo' no = 828  )
                              (  name = 'Lionel Messi'      no = 806  ) ).
    APPEND INITIAL LINE TO lt_record REFERENCE INTO lr_ref.
    lr_ref->record_name = 'Assists'.
    lr_ref->record = VALUE #( (  name = 'Lionel Messi' no = 332  )
                              (  name = 'Luis Suarez'      no = 234  ) ).

    APPEND INITIAL LINE TO lt_record REFERENCE INTO lr_ref.
    lr_ref->record_name = 'Trophies'.
    lr_ref->record = VALUE #( (  name = 'Lionel Messi' no = 43  )
                              (  name = 'Dani Alves'  no = 43  ) ).

    lo_mustache_ref = zcl_mustache=>create(
*     'Records of Football' && cl_abap_char_utilities=>newline &&
     'Highest No.of {{record_name}}?' && cl_abap_char_utilities=>newline &&
     '{{#record}}' && cl_abap_char_utilities=>newline &&
     '*{{ name }} - {{ no }}' && cl_abap_char_utilities=>newline &&
     '{{/record}}'
     ).

    out->write( lo_mustache_ref->render( lt_record ) ).

  ENDMETHOD.

ENDCLASS.
