Rails.application.routes.draw do
  resources :syllabuses do
    resources :events
  end
  resources :years
  resources :semesters
  get 'staticpages/faq'

  get 'staticpages/about'

  resources :books
  resources :subjects
  resources :universities
  devise_for :users
  resources :courses do
    member do
      post 'enroll'
    end
  end  
  root 'posts#index'
  resources :posts do
    resources :comments do
      member do
        put "like",    to:"comments#upvote"
        put "dislike", to:"comments#downvote"
      end
    end
    member do
      put "like",    to:"posts#upvote"
      put "dislike", to:"posts#downvote"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
