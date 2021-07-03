class ApplicationController < ActionController::Base
  include ActionView::Helpers::UrlHelper
  # MEMO: Rails5.2 からはデフォルトで有効なので必要ない
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :group_list
  before_action :group_badge

  protected
    def configure_permitted_parameters
      # MEMO: ここにも末尾全角スペースが入っていて、意図したシンボルになっていない
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
        # MEMO: user と group が has_many through 設定しているので current_user.groups で行ける
        @group_lists = current_user.group_members.includes([:group]).where(activated: true)
        # MEMO: ここはチェックしなくても Array 相当になっているので初期化する必要はない
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
end
