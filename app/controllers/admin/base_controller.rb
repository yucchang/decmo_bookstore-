class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :permittion_check! 
  layout 'backend'


  private
  def permittion_check!
    if current_user.role != 'admin'
      redirect_to root_path, notice: 'Not authorized'
    end
  end
end
