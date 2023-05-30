CLASS y219_abap_git_week_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_serializable_object .
    INTERFACES z2ui5_if_app .

    DATA user TYPE string.
    DATA date TYPE string.
    DATA check_initialized TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS y219_abap_git_week_2 IMPLEMENTATION.
METHOD z2ui5_if_app~main.

    IF check_initialized = abap_false.
      check_initialized = abap_true.
      user = 'Rahul'.
      date = |{ sy-datum DATE = USER }|.
    ENDIF.

    CASE client->get( )-event.
      WHEN 'BUTTON_POST'.
        client->popup_message_toast( |App executed on { date } by { user }| ).
      WHEN 'BACK'.
        client->nav_app_leave( client->get_app( client->get( )-id_prev_app_stack  ) ).
    ENDCASE.

    client->set_next( VALUE #( xml_main = z2ui5_cl_xml_view=>factory(
        )->shell(
        )->page(
                title          = 'abap2UI5 - Week 2 Developer challenge'
                navbuttonpress = client->_event( 'BACK' )
                shownavbutton  = abap_true
            )->header_content(
            )->get_parent(
            )->simple_form( title = 'Form Details' editable = abap_false
                )->content( 'form'
                    )->title( 'Input'
                    )->label( 'User'
                    )->input( value = client->_bind( user )
                    )->label( 'Date'
                    )->date_picker( client->_bind( date )
                    )->button(
                        text  = 'post'
                        press = client->_event( 'BUTTON_POST' )
         )->get_root( )->xml_get( ) ) ).

  ENDMETHOD.
ENDCLASS.
