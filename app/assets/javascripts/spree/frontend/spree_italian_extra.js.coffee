check_tax_code = ->
  if $('#order_bill_address_attributes_country_id option:selected').text() == "Italy"
    $('#order_bill_address_attributes_tax_code').addClass('required')
    $('#btax_code').show()
  else
    $('#order_bill_address_attributes_tax_code').removeClass('required')
    $('#btax_code').hide()

  $('#order_ship_address_attributes_country_id option:selected').each ->
    unless $('input[name="order[use_billing]"]')[0].checked
      if $('#order_ship_address_attributes_country_id option:selected').text() == "Italy"
        $('#order_ship_address_attributes_tax_code').addClass('required')
        $('#stax_code').show()
      else
        $('#order_ship_address_attributes_tax_code').removeClass('required')
        $('#stax_code').hide()
$ ->
  check_tax_code()
  $('#order_bill_address_attributes_country_id').change(check_tax_code)
  $('#order_ship_address_attributes_country_id').change(check_tax_code)
