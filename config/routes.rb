Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  authenticated :admin do
    root to: redirect("dashboard")
    resource :dashboard, only: %i[show]
  end

  get "/", to: redirect("/admins/sign_in")
end
