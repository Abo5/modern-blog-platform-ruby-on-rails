class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :authenticate_user!

  # Override Devise's after_sign_in_path_for
  def after_sign_in_path_for(resource)
    if resource.admin?
      blog_articles_path
    else
      user_ui_path
    end
  end
end
