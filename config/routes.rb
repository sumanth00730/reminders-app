Rails.application.routes.draw do
  get 'reminders/index'
  get 'reminders/new'
  get 'reminders/edit'
  get 'reminders/update'
  get 'reminders/show'
  get 'reminders/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :reminders
  resources :reminder_types
end
