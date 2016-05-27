class EventDecorator < Draper::Decorator
  delegate_all

  def formatted_date
    object.date.present? ? object.date.strftime("%F") : ""
  end
end
