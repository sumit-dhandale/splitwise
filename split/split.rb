class Split
  attr_accessor :user, :amount_owe

  def initialize(user, amount_owe)
    @user = user
    @amount_owe = amount_owe
  end
end
