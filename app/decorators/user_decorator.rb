class UserDecorator < Draper::Decorator
  delegate_all

  def display_name
    return full_name if name_present?
    name_from_email
  end

  def gravatar
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{hash}?size=256"
  end

  def city
    city_present? ? profile.city.name : 'Not specified'
  end

  def profile_trait(trait)
    ProfileTrait.find_by(profile_id: profile.id, trait_id: trait.id)
  end

  private

  def full_name
    "#{profile.first_name} #{first_letter_of_last_name}."
  end

  def name_present?
    profile.first_name.present? && profile.last_name.present?
  end

  def city_present?
    profile.city.present?
  end

  def first_letter_of_last_name
    profile.last_name.chars.first
  end

  def name_from_email
    email.split('@').first
  end
end
