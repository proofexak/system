class AddUserIdToCustomerInfo < ActiveRecord::Migration
  def change
    add_reference :customer_infos, :user, index: true, foreign_key: true
  end
end
