class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
    	t.string :title
    	t.string :desc
    	t.float :price
    	t.integer :category_id
        t.timestamps
     end
    
    create_table :categories do |t|
  
    	t.string :name
    end  
    
    create_table :contacts do |t|
      t.string :description
      t.integer :user_id
      t.integer :listing_id
      t.timestamps
     end
      
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :is_admin
      t.timestamps
    end
  end
end
