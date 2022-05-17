class ChangeDataTypeDeadlineOfCompanies < ActiveRecord::Migration[6.1]
  def change
    change_column :companies, :deadline, :integer
  end
end
