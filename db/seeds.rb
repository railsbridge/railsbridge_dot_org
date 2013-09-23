require Rails.root.join('db', 'seeds', 'admin_user')

if Rails.env.development?
  Seeder::admin_user
end
