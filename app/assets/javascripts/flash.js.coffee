jQuery ->
  $(".notice, .error").mouseover ->
    self = $(this)
    setTimeout ->
      self.slideUp()
    , 1000
