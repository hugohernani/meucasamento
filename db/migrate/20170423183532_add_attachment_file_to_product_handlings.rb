class AddAttachmentFileToProductHandlings < ActiveRecord::Migration
  def self.up
    change_table :product_handlings do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :product_handlings, :file
  end
end
