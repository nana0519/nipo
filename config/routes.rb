Rails.application.routes.draw do
  # EndUser
  devise_for :end_users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  devise_scope :end_user do
    get "end_users/:id/edit" => "public/registrations#edit", as: :edit_other_end_user_registration
    match "end_users/:id", to: "public/registrations#update", via: [:patch], as: :other_end_user_registaration
  end

  scope module: :public do
    root to: "homes#top"
    resources :daily_reports, only: [:new, :create] do
      collection do
        get :thank_you
      end
    end
  end

  # 管理者
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "homes#top"
    resources :cars, only: [:new, :create, :index, :edit, :update]
    resources :end_users, only: [:index, :edit, :update]
    resources :companies, only: [:new, :create, :index, :show, :edit, :update]
    resources :constructions, only: [:index, :show, :new, :create, :edit, :update] do
      collection do
        get :constructions_index
      end
      member do
        get :end_users_index
      end
    end
    
    resources :daily_reports, only: [:new, :create, :show, :edit, :update] do
      member do
        get :image
      end
    end
    
    resources :work_schedules, only: [:new, :create, :index, :show]

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
