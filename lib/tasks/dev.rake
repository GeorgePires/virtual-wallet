if Rails.env.development?
  namespace :dev do
    desc 'Configure development environment'
    task setup: :environment do
      show_activity
    end
  end

  def spinner(start)
    spinner = TTY::Spinner.new("[:spinner] #{start}")
    spinner.auto_spin
    yield
    spinner.success('(successful)')
  end

  def show_activity
    spinner('Dropped database..') { `rails db:drop` }
    spinner('Created database..') { `rails db:create` }
    spinner('Migrating..') { `rails db:migrate` }
    spinner('Create default Admin and User with wallet..') { `rails db:seed` }
  end
end
