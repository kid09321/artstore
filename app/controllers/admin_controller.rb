class AdminController < ApplicationController
  layout "admin"

  before_action :admin_required
  before_action :authenticate_user!
end
