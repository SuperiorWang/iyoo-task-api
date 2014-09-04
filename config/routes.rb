Rails.application.routes.draw do

  resources :personal_data

  resources :tasks 

  resources :sessions

  resources :users do 

    resources :user_task_intermediates do 
      member do 
        get 'change_number'
        patch 'update_number'
      end
    end

    resources :firend_relationships do 
      resources :alert_tasks
    end 

    resources :social_records 

    resources :personal_data

    member do
      get 'notice', to: 'users#my_notice' 
      get 'friend', to: 'users#notice_friend'
    end
  end 

end 
