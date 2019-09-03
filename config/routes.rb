Rails.application.routes.draw do
    root to: 'shorteners#new'
	match '/short_link' => 'shorteners#new', via: :get
	match '/short_link' => 'shorteners#create', via: :post
	match '/shortened_page' => 'shorteners#shortened_page', via: :get
	match '/shortened' => 'shorteners#shortened', via: :post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
