class Notifications
  constructor: ->
    @notification = $('[data-behaviour = "notifications"]')
    @setup() if @notification.length > 0

  setup: ->
    $("[data-behaviour='notifications-btn']").on "click", @handleClick
    $.ajax(
      url: "/notifications.json"
      method: "GET"
      dataType: "JSON"
      success: @handleSuccess
    )

  handleSuccess: (data) =>
    if data.nil?
      @text = "<p>No new notifications</p>"
      $("[data-behaviour='notification-items']").html(@text)
      return

    items = $.map data, (notification) ->
      "<a class = 'dropdown-item' href=#{notification.url}>#{notification.actor} #{notification.action} #{notification.action_receipient}</a>"

    $("[data-behaviour='unread-count']").text(items.length)
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
    )
    $("[data-behaviour = 'notification-items']").toggle()


jQuery ->

  new Notifications