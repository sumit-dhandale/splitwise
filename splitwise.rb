require_relative './user/user_controller'
require_relative './group/group_controller'
require_relative './split/split'
require_relative 'balance_sheet_controller'

class Splitwise
  attr_reader :user_controller, :group_controller, :balance_sheet_controller

  def initialize
    @user_controller = UserController.new
    @group_controller = GroupController.new
    @balance_sheet_controller = BalanceSheetController.new
  end

  def demo
    add_users_to_splitwise_app
    add_groups_to_splitwise_app
    add_members_to_group

    group = group_controller.get_group("G1001")

    group.create_expense("Exp1001", "Breakfast", 900, create_splits_for_expense("U1001" => 300, "U2001" => 300, "U3001" => 300), :EQUAL, user_controller.get_user("U1001"))
    group.create_expense("Exp1002", "Lunch", 500, create_splits_for_expense("U1001" => 400, "U2001" => 100), :UNEQUAL, user_controller.get_user("U2001"))

    user_controller.all_users.each do |user|
      balance_sheet_controller.show_balance_sheet_of_user(user)
    end
  end

  private

  def add_users_to_splitwise_app
    user_controller.add_user(User.new("U1001", "User1"))
    user_controller.add_user(User.new("U2001", "User2"))
    user_controller.add_user(User.new("U3001", "User3"))
  end

  def add_groups_to_splitwise_app
    user1 = user_controller.get_user("U1001")
    group_controller.create_new_group("G1001", "Outing with Friends", user1)
  end

  def add_members_to_group
    group = group_controller.get_group("G1001")
    group.add_member(user_controller.get_user("U2001"))
    group.add_member(user_controller.get_user("U3001"))
  end

  def create_splits_for_expense(split_details)
    splits = []
    split_details.each do |user_id, amount|
      splits << Split.new(user_controller.get_user(user_id), amount)
    end
    splits
  end
end
