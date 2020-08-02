class ApplicationController < ActionController::Base
  include ActionView::Helpers::UrlHelper
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :group_list
  before_action :group_badge
  # before_action :form_path

  protected
    def configure_permitted_parameters
      added_attrs = [ :name, :email, :password, :password_confirmation　]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
      devise_parameter_sanitizer.permit(:sign_up, keys: [:image])
      devise_parameter_sanitizer.permit(:account_update, keys: [:image])
    end

    private

    def group_list
      if user_signed_in?
        @group_lists = current_user.group_members.where(activated: true)
        if @group_lists.present?
          @group_lists
        else
          @group_lists = []
        end
      end
    end

    def group_badge
      if user_signed_in?
        @request = current_user.group_members.where(activated: false)
      end
    end

    # def form_path
    #     @group = Group.find_by(params[:id])
    # end
end
