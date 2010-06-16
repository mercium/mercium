Mercium::Application.routes.draw do |map|

  if Rails.env.development?
    default_url_options(:host => '127.0.0.1:3000')
  end

  if Rails.env.test?
    default_url_options(:host => 'www.example.com')
  end

  devise_for :customers

end
