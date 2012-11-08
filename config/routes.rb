Gnotov::Application.routes.draw do
  scope "(:locale)", :locale => /en|ru|lv|de/ do
    devise_for :users, :path => "admin", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'sign_in' }

    namespace "admin" do

      resources :works

    end

    match "admin" => redirect("/admin/works")

    root :to => "homes#index"

    match '/:locale' => 'homes#index', :as => 'homes', :via => :get
    match '/:locale' => 'homes#create', :as => 'homes', :via => :post

  end
end
