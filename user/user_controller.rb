require_relative 'user'

class UserController
  attr_reader :user_list

  def initialize
    @user_list = []
  end

  def add_user(user)
    user_list << user
  end

  def get_user(user_id)
    user_list.find { |user| user.user_id == user_id }
  end

  def all_users
    user_list
  end
end
