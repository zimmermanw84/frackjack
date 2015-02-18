class CreateGames < ActiveRecord::Migration
  def change
  	create_table :games do |t|
  		t.string :user_id
  		t.integer :score, default: 0

  		t.timestamps
  	end
  end
end
