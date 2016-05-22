class UserDecorator < Draper::Decorator
  delegate_all

  def display_name
    object.first_name.present? ? "#{first_name} #{last_name}" : object.email
  end
end
