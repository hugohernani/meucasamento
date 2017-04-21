class CreateBankAccount < ActiveRecord::Migration[5.0]
  def change
    create_table :bank_accounts do |t|
      t.references :wedding_support, foreign_key: true, index: true
      t.string :name
      t.string :bank
      t.string :agency
      t.string :account
      t.string :operation

      t.timestamps
    end
  end
end
