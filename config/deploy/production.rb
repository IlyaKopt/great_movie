role :app, %w(deploy@138.68.84.233)
role :web, %w(deploy@138.68.84.233)
role :db, %w(deploy@138.68.84.233)
set :rails_env, 'production'

server '138.68.84.233',
       user: 'deploy',
       roles: %w{app db web},
       ssh_options: {
           user: 'deploy',
           forward_agent: true,
           auth_methods: %w(publickey)
       }

