Rails.application.routes.draw do
  root :to => 'lists#index'
  resources :lists do
    resources :tasks, :except => [:show, :index] do
      get 'finish_task', to: "tasks#finish_task"
    end
  end
  get 'find_list', to: "lists#find"

end
