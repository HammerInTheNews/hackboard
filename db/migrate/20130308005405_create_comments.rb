class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      #name it post_id because it's the name of the model you're associating with "Post"
      t.integer :post_id

      t.timestamps
    end
  end
end
