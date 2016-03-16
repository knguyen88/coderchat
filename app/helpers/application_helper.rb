module ApplicationHelper
  def friendly_error_message(validation_result, field)
    validation_result.errors.full_messages_for(field).join('. ')
  end

  def error_class(validation_result, field)
    validation_result.errors[field].empty? ? '' : 'has-error'
  end
end
