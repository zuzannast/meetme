module ApplicationHelper
  def app_path
    '/app'
  end

  def events_list_path
    '/events_list'
  end

  def redirect_to_app_or_profile
    if city_not_set?
      redirect_to user_profile_path(current_user.id), flash: { notice: update_city_message }
    else
      redirect_to app_path
    end
  end

  private

  def city_not_set?
    current_user.profile.city.nil?
  end

  def update_city_message
    "Seems like you haven't set your city yet. Please do it before continuing."
  end
end
