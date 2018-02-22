class PagesController < ApplicationController
  def planner
    puts session[:user_id]
  end
end
