module ApplicationHelper
  # Print an info icon that when clicked displays a qtip info message.
  # @param message [String]
  def info_icon(message, icon_class='info-icon')
    content_tag(:div, nil,
                class: icon_class,
                rel: 'tooltip',
                data: {
                    placement: 'top',
                    trigger: 'hover'
                },
                title: message)
  end
end
