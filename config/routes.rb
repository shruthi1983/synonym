Rails.application.routes.draw do
  root "synonyms#index"
  devise_for :users
  resources :synonyms do
    member do
      put "like" => "synonyms#upvote"
      put "unlike" => "synonyms#downvote"
    end
   resources :comments

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end