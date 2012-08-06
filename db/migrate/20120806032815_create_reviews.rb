class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :product_id
      t.integer :user_id
      t.integer :rating
      t.text :comment
      t.string :user_email
      t.string :status, :default => "active"

      t.timestamps
    end
  end
end
