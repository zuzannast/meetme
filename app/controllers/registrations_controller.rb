class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    case resource
    when :user, User
      create_user_profile
      edit_user_path(resource.id)
    else
      super
    end
  end

  private

  def create_user_profile
    Profile.create(user_id: resource.id)
  end
end
