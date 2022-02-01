class Api::V1::DashboardController < ApplicationController

  def index
    @students = User.where(role: 'student')
  end

end
