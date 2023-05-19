CLASS y219_abap_git_week_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS display IMPORTING iv_value TYPE string RETURNING VALUE(rv_value) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS y219_abap_git_week_1 IMPLEMENTATION.
  METHOD display.
*iv_value = 'Hello World'.
    rv_value = 'Hello World'.
  ENDMETHOD.
ENDCLASS.
