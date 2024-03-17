# require_relative 'split_factory'
require_relative '../balance_sheet_controller'
require_relative 'expense'

class ExpenseController
  attr_reader :balance_sheet_controller

  def initialize
    @balance_sheet_controller = BalanceSheetController.new
  end

  def create_expense(expense_id, description, expense_amount, split_details, split_type, paid_by_user)
    # expense_split = SplitFactory.get_split_object(split_type)
    # expense_split.validate_split_request(split_details, expense_amount)

    expense = Expense.new(expense_id, expense_amount, description, paid_by_user, split_type, split_details)

    balance_sheet_controller.update_user_expense_balance_sheet(paid_by_user, split_details, expense_amount)

    expense
  end
end
