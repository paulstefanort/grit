Grit::Application.routes.draw do
  get "site/index"
	root :to => "site#index"

	resources :things do
	end
end
