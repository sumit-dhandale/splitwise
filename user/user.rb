require_relative '../user_expense_balance_sheet'

class User
  attr_reader :user_id, :user_name, :user_expense_balance_sheet

  def initialize(user_id, user_name)
    @user_id = user_id
    @user_name = user_name
    @user_expense_balance_sheet = UserExpenseBalanceSheet.new
  end
end
