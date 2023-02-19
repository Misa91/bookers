Rails.application.routes.draw do
  get 'books' => 'books#index'
  get 'books' => 'books#new' #データを新規作成する
  post 'books' => 'books#create' #データを新規保存する
  get 'books/:id' => 'books#show', as: 'book'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  get 'homes' => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
