class Api::V1::DashboardController < ApplicationController

  def index
    @students = User.where(role: 2)
  end

end
