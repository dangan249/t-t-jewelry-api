TTJewelryApi::Application.routes.draw do

  scope 'api', defaults: { format: :json } do
    resources :products
    resources :brands
  end
end
