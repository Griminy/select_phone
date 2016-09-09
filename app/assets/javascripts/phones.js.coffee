jQuery ->
  $('#brand').change ->
    brand_page = $('#brand').val()
    models_path = $('#brand').data('ajax-path')
    models_path_with_params = "#{models_path}?brand_page=#{brand_page}"

    if brand_page
      $.ajax models_path_with_params,
        type: 'GET'
        dataType: 'script'

  $('#model').change ->
    phone_page = $('#model').val()
    phone_path = $('#model').data('ajax-path')
    phone_path_with_params = "#{phone_path}?phone_page=#{phone_page}"

    if phone_page
      $.ajax phone_path_with_params,
        type: 'GET'
        dataType: 'script'

  $(".js-search").keyup ->
    query = $('.js-search').val()
    phone_path = $('.js-search').data('ajax-path')
    phone_path_with_params = "#{phone_path}?query=#{query}"

    if query
      $.ajax phone_path_with_params,
        type: 'GET'
        dataType: 'script'
