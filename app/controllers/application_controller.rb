class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :group_list
  before_action :group_badge
  before_action :form_path

  protected
    def configure_permitted_parameters
      added_attrs = [ :name, :email, :password, :password_confirmation　]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
      devise_parameter_sanitizer.permit(:sign_up, keys: [:image])
      devise_parameter_sanitizer.permit(:account_update, keys: [:image])
    end

    def group_list
      @groups = Group.select(:id,:name)
    end

    def group_badge
      if current_user.present?
        @request = current_user.group_members.where(user_id: current_user.id,activated: false)
      else
        @request = []
      end
    end

    def form_path
      @group = Group.find_by(params[:id])
    end

end
