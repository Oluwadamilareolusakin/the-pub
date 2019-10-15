# frozen_string_literal: true

json.array! @notifications.each do |notification|
  json.type do
    notification.notifyable.class.to_s.underscore.humanize
  end
  json.actor notification.actor.name
  json.action notification.action
  json.action_receipient "your #{notification.notifyable_type.to_s.humanize.downcase}"
  json.url send("#{notification.notifyable.class.to_s.underscore}_path", notification.notifyable.id)
end
