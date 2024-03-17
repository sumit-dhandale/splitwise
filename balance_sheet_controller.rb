require_relative 'balance'

class BalanceSheetController
    def update_user_expense_balance_sheet(expense_paid_by, splits, total_expense_amount)
      # Update the total amount paid of the expense paid by user
      paid_by_user_expense_sheet = expense_paid_by.user_expense_balance_sheet
      paid_by_user_expense_sheet.total_payment += total_expense_amount
  
      splits.each do |split|
        user_owe = split.user
        owe_user_expense_sheet = user_owe.user_expense_balance_sheet
        owe_amount = split.amount_owe
  
        if expense_paid_by.user_id == user_owe.user_id
          paid_by_user_expense_sheet.total_your_expense += owe_amount
        else
          # Update the balance of the paid user
          paid_by_user_expense_sheet.total_you_get_back += owe_amount
  
          user_owe_balance = paid_by_user_expense_sheet.user_vs_balance[user_owe.user_id] || Balance.new
          user_owe_balance.amount_get_back += owe_amount
          paid_by_user_expense_sheet.user_vs_balance[user_owe.user_id] = user_owe_balance
  
          # Update the balance sheet of owe user
          owe_user_expense_sheet.total_you_owe += owe_amount
          owe_user_expense_sheet.total_your_expense += owe_amount
  
          user_paid_balance = owe_user_expense_sheet.user_vs_balance[expense_paid_by.user_id] || Balance.new
          user_paid_balance.amount_owe += owe_amount
          owe_user_expense_sheet.user_vs_balance[expense_paid_by.user_id] = user_paid_balance
        end
      end
    end
  
    def show_balance_sheet_of_user(user)
      puts "---------------------------------------"
      puts "Balance sheet of user : #{user.user_id}"
  
      user_expense_balance_sheet = user.user_expense_balance_sheet
  
      puts "TotalYourExpense: #{user_expense_balance_sheet.total_your_expense}"
      puts "TotalGetBack: #{user_expense_balance_sheet.total_you_get_back}"
      puts "TotalYourOwe: #{user_expense_balance_sheet.total_you_owe}"
      puts "TotalPaymentMade: #{user_expense_balance_sheet.total_payment}"
  
      user_expense_balance_sheet.user_vs_balance.each do |user_id, balance|
        puts "userID: #{user_id} YouGetBack: #{balance.amount_get_back} YouOwe: #{balance.amount_owe}"
      end
  
      puts "---------------------------------------"
    end
  end
  