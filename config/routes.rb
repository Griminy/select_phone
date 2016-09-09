Rails.application.routes.draw do
  root 'phones#select_phone'
  get 'select_phone'          => 'phones#select_phone',          as: :select_phone
  get 'get_models_for_select' => 'phones#get_models_for_select', as: :get_models_for_select
  get 'get_phone_info'        => 'phones#get_phone_info',        as: :get_phone_info
end
