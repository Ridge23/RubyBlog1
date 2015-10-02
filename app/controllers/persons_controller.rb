class PersonsController < ApplicationController
  before_filter :authenticate_user!

  def profile
  end

  def admin_set_moderator
    if current_user.admin?
      user = User.find(params[:id])
      user.update_attribute(:moderator, true)
      redirect_to admin_users_path
    end
  end

  def admin_user_remove
    if current_user.admin?
      user = User.find(params[:id])
      user.delete
      redirect_to admin_users_path
    end
  end

end
