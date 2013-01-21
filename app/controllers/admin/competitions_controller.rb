class Admin::CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end
end