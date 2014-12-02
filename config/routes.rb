Rails.application.routes.draw do
  root to: 'todos/index'

  match "todos/delete" => "todos#delete", :via => [:delete], :as => :delete

  match "todos/add" => "todos#add", :via => [:post], :as => :add

  match "todos/complete" => 'todos#complete', :via => :post

end
