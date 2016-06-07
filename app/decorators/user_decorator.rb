class UserDecorator < Draper::Decorator
  delegate_all

  def display_name
    object.first_name.present? ? "#{first_name} #{last_name.chars.first}." : object.email.split('@').first
  end

  def gravatar
    hash = Digest::MD5.hexdigest(object.email)
    "http://www.gravatar.com/avatar/#{hash}"
  end
end
