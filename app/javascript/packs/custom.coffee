class Notifications
  constructor: ->
    @notification = $('[data-behaviour = "notifications"]')
    @setup() if @notification.length

  setup: ->
    $("[data-behaviour='notifications-btn']").on "click", @handleClick
    $.ajax(
      url: "/notifications.json"
      method: "GET"
      dataType: "JSON"
      success: @handleSuccess
    )

  handleSuccess: (data) =>
    items = $.map data, (notification) ->
      "<a class = 'dropdown-item' href=#{notification.url}>#{notification.actor} #{notification.action} #{notification.action_receipient}</a> <hr>"

    $("[data-behaviour='unread-count']").text(items.length || 0)
    if items.length == 0
      @empty = "<p>No notifications for you</p>"
      $("[data-behaviour='notification-items']").html(@empty) 
      return
      
    $("[data-behaviour='notification-items']").html(items)


  handleClick: (e) =>
    $.ajax(
      url: "/notifications/mark_as_read"
      dataType: "JSON",
      method: "POST",
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      },
      success: ->
        $("[data-behaviour='unread-count']").text(0)
        $("[data-behaviour = 'notification-items']").toggleClass('open-dropdown')
    )


class Toast
  constructor: ->
    @toast = $("[data-behaviour = 'toast']")
    @closeToast(0) if @toast.length > 0

  closeToast: (count) =>
    while count <= 1000000000
      count += 1
    
    if count >= 1000000000
      @toast.toggleClass('close-toast') 


jQuery ->

  new Notifications

jQuery ->

  new Toast