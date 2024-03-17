require_relative '../expense/expense_controller'

class Group
  attr_accessor :group_id, :group_name
  attr_reader :group_members, :expense_list

  def initialize
    @group_members = []
    @expense_list = []
    @expense_controller = ExpenseController.new
  end

  def add_member(member)
    group_members << member
  end

  def create_expense(expense_id, description, expense_amount, split_details, split_type, paid_by_user)
    expense = @expense_controller.create_expense(expense_id, description, expense_amount, split_details, split_type, paid_by_user)
    expense_list << expense
    expense
  end
end
