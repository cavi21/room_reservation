$ ->
  $(".js_hide").hide()

  # Set up date picker objects
  $(".report_datetime, .block_datetime").datetimepicker {
    stepMinute: 30,
    minuteMax: 30,
    dateFormat: 'yy-mm-dd'
  }
  $( "#room_reservation_which_date" ).datepicker {
    numberOfMonths: 2,
    minDate: 0,
    dateFormat: 'yy-mm-dd'
  }
  
  # Set up sortable list for rooms
  $('ul#list_rooms').sortable { 
    handle: "i.icon-move"
    update: -> $(this).closest("form").submit()
    opacity: 0.4
    cursor: 'move'
  }
  
  # Set date picker for reservation date to readonly and autocomplete off
  $("#room_reservation_which_date").attr {
    "readonly": "true",
    "autocomplete": "off"
  }
  
  # Disable main form submit if no date was selected
  # And then enable once it is
  $('button#generate_grid').attr("disabled","true")
  $(document).on "change", 'input#room_reservation_which_date', ->
    $('button#generate_grid').removeAttr("disabled")
    
  # Submit edit user form when admin checkbox is changed
  $("#show_user").on 'change', "input[type='checkbox']", ->
    $(this).closest("form").submit()
  
  # Initialize modal dialog boxes
  $(document).on 'click', ".launch_modal", ->
    $("#ajax-modal").removeClass("fullscreen")
    $("#ajax-modal").find(".modal-footer").html($('<button type="button" data-dismiss="modal" class="btn btn-large">Cancel</button>'))
    $("#ajax-modal").find(".modal-title").html("Loading...")
    $("#ajax-modal").find(".modal-header").find(".legend, p").remove()  
    $("#ajax-modal").find(".modal-body-content").html('')
    $("#ajax-modal").find(".modal-body").removeAttr("style")
    $("#ajax-modal").find(".ajax-loader").show()
    $("#ajax-modal").modal('show')
  
  $(document).on 'click', "#ajax-modal a.close_dialog", (e) ->
    e.preventDefault()
    $("#ajax-modal").modal('hide')
    $("#room_reservation_which_date").focus()
    $("#room_reservation_which_date").effect("highlight", {}, 3000)
    false
  
  $(document).on 'mouseenter', ".preview_image", ->
    $(this).popover {
      placement: 'right',
      title: null,
      html: true,
      content: '<img src="' +this+ '" />',
      trigger: 'hover',
    }
    $(this).popover('show')
    
  $(document).on 'mouseenter', ".preview_link", ->
    $(this).tooltip {
      placement: 'bottom',
      trigger: 'hover',
    }
    $(this).tooltip('show')
  
