Rails.application.routes.draw do
  devise_for :users, skip: :all
  namespace "api" do
    namespace "v1" do
      scope "user" do
        get "index", to: "user#index"
        get "show/:id", to: "user#show"
        post "create", to: "user#create"
        patch "update/:id", to: "user#update"
        delete "delete/:id", to: "user#delete"
      end
    end
  end
end
