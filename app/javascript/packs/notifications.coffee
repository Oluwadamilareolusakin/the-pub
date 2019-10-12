class Notifications
  constructor: ->
    @notification = $('[data-behaviour = "notifications"]')
    @setup() if @notification.length > 0

  setup: ->
    $.ajax(
      url: "/notifications.json"
      method: "GET"
      dataType: "JSON"
      success: @handleSuccess
    )

  handleSuccess: (data) =>
    items = $.map data, (notification) ->
      "<a class = 'dropdown-item' href=#{notification.url}>#{notification.actor} #{notification.action} #{notification.action_receipient}</a>"

    $("[data-behaviour='unread-count']").text(items.length)
    $("[data-behaviour='notification-items']").html(items)

jQuery ->

  new Notifications