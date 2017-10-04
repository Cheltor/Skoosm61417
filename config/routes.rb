Rails.application.routes.draw do
  root 'staticpages#dashboard'
  get 'dashboard' => 'staticpages#dashboard'
  get 'myposts' => 'posts#myposts'
  get 'mycomments' => 'comments#mycomments'  
  resources :syllabuses do
    resources :events
  end
  resources :years
  resources :semesters
  get 'faq' => 'staticpages#faq'
  get 'about' => 'staticpages#about'
  resources :flags
  get 'flagged' => "flags#flagged"
  get 'flag' => "flags#flags"
  resources :hides
  get 'hidden' => "hides#hidden"
  get 'hide' => "hides#hides"
  resources :books do
    member do
      post 'flag'
    end
  end
  resources :subjects
  resources :universities
  devise_for :users
  resources :courses do
    member do
      post 'enroll'
    end
  end  
  resources :enrolls
  resources :posts do
    resources :comments do
      member do
        put "like",    to:"comments#upvote"
        put "dislike", to:"comments#downvote"
        post 'hide'
      end
    end
    member do
      put "like",    to:"posts#upvote"
      put "dislike", to:"posts#downvote"
      post 'flag'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
