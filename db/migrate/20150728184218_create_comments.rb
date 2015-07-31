class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.timestamps
      t.references :post, index:true, foreign_key: true
      t.string :text
    end
  end
end  
