Rails.application.routes.draw do
  get 'rewards/myrewards'

  get 'allbiz' => 'staticpages#allbiz'

  resources :rewards
  devise_for :businesses, path: 'businesses'
  root 'staticpages#dashboard'
  get 'dashboard2' => 'staticpages#dashboard2'
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
  devise_for :users, path: 'users'
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
