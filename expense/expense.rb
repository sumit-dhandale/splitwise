# require_relative 'split/split'

class Expense
  attr_reader :expense_id, :description, :expense_amount, :paid_by_user, :split_type, :split_details

  def initialize(expense_id, expense_amount, description, paid_by_user, split_type, split_details)
    @expense_id = expense_id
    @expense_amount = expense_amount
    @description = description
    @paid_by_user = paid_by_user
    @split_type = split_type
    @split_details = split_details
  end
end
