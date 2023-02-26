# Hi!, use the rails dev:setup command to create data.

# Create default User
PASSWORD_ADMIN = 123_246
Admin.create!(email: 'admin@gmail.com', password: PASSWORD_ADMIN, password_confirmation: PASSWORD_ADMIN)