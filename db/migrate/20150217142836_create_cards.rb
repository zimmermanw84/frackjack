class CreateCards < ActiveRecord::Migration
  def change
  	create_table :cards do |t|
      t.integer :deck_id
      t.string :name
      t.integer :value
      t.string :img_url
      t.boolean :player_hand, default: false
      t.boolean :dealer_hand, default: false

  		t.timestamps
  	end
  end
end
