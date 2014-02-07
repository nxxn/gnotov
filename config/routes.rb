Gnotov::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  scope "(:locale)", :locale => /en|ru|lv|de/ do
    devise_for :users, :path => "admin", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'sign_in' }

    namespace "admin" do

      resources :works
      resources :posts

    end

    match "admin" => redirect("/admin/works")

    root :to => "homes#index"

    match '/:locale' => 'homes#new', :as => 'message', :via => :get
    match '/:locale' => 'homes#create', :as => 'message', :via => :post

    match 'pricelist' => 'homes#pricelist', :as => :pricelist, :defaults => { :format => "xml" }

    match 'posts' => 'posts#index'

    match 'about' => 'homes#about'
    match 'contacts' => 'homes#contacts'
    match 'portfolio' => 'homes#works'

  end
end
