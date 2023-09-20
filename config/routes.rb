Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ptbr/ do
    devise_for :users
    root "site#index"
    put '/changeLanguage' => "application#changeLanguage"
  end
end
