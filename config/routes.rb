Rails.application.routes.draw do
  match "/" => "todos#index", :via => [:get], :as => :get
  
  get 'todos/index'

  match "todos/delete" => "todos#delete", :via => [:delete], :as => :delete

  match "todos/add" => "todos#add", :via => [:post], :as => :add

  match "todos/complete" => 'todos#complete', :via => :post

end
