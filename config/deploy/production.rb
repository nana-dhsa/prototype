set :user, "root"
set :deploy_via, :remote_cache
set :conditionally_migrate, true
set :rails_env, "production"

# Phần IP thì bạn thay thế cho phù hợp với IP của Docker container nhé
server "172.18.0.5", user: fetch(:user), port: fetch(:port), roles: %w(web app db)
