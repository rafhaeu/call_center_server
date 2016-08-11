$ ->
  $('#clients_search input').keyup ->
    $(this).val $(this).val().replace(/ς/g, 'σ')
    if @value != @lastValue
      if @timer
        @lastValue = @value
        clearTimeout @timer
      @timer = setTimeout((->
        $.get $('clients_search').attr('action'), $('#clients_search').serialize(), null, 'script'
      ), 300)
      return
    return
  return
return
