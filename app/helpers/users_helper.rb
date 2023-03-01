module UsersHelper
  def color_transaction(transaction_type)
    color = transaction_type == 'credit' ? 'green' : 'red'
    "px-2 py-1 font-semibold leading-tight text-#{color}-700 bg-#{color}-100 rounded-full dark:text-#{color}-100 dark:bg-#{color}-700"
  end
end
