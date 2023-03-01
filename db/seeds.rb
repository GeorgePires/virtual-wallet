# Hi!, use the rails dev:setup command to create data.

# Create default Admin end User
PASSWORD_ADMIN = 123_246
Admin.create!(email: 'admin@gmail.com', password: PASSWORD_ADMIN, password_confirmation: PASSWORD_ADMIN)

user = User.create!(name: 'User default', email: 'default@gmail.com')

user.wallet.credit(3780) && user.wallet.debit(132.98)