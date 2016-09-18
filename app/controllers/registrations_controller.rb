class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    case resource
    when :user, User
      new_user_profile_path(resource.id)
    else
      super
    end
  end
end
