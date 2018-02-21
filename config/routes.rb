Rails.application.routes.draw do
  resource :calendar, only: [:show], controller: :calendar

  controller :pages do
    get :planner
  end

end
