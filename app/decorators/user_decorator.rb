class UserDecorator < Draper::Decorator
  delegate_all

  def display_name
    name_present? ? "#{first_name} #{last_name.chars.first}." : object.email.split('@').first
  end

  def gravatar
    hash = Digest::MD5.hexdigest(object.email)
    "http://www.gravatar.com/avatar/#{hash}?size=256"
  end

  private

  def name_present?
    object.first_name.present? && object.last_name.present?
  end
end
