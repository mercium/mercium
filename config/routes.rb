Mercium::Application.routes.draw do |map|

  if Rails.env.development?
    default_url_options(:host => '127.0.0.1:3000')
  end

  if Rails.env.test?
    default_url_options(:host => 'www.example.com')
  end

  root :to => 'shop#index'

  devise_for :customers,
    :path => 'account',
    :path_names => {
      :sign_in  => 'login',
      :sign_out => 'logout',
      :sign_up  => 'register'
    }

  devise_for :users,
    :path => 'admin',
    :path_names => {
      :sign_in  => 'login',
      :sign_out => 'logout',
      :sign_up  => 'register'
    }

end
