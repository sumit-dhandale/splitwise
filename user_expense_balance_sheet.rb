class UserExpenseBalanceSheet
  attr_accessor :user_vs_balance, :total_your_expense, :total_payment, :total_you_owe, :total_you_get_back

  def initialize
    @user_vs_balance = {}
    @total_your_expense = 0
    @total_payment = 0
    @total_you_owe = 0
    @total_you_get_back = 0
  end
end
