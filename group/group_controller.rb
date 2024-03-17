require_relative 'group'

class GroupController
  attr_reader :group_list

  def initialize
    @group_list = []
  end

  def create_new_group(group_id, group_name, created_by_user)
    group = Group.new
    group.group_id = group_id
    group.group_name = group_name
    group.add_member(created_by_user)
    group_list << group
  end

  def get_group(group_id)
    group_list.find { |group| group.group_id == group_id }
  end
end
