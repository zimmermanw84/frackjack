class CreateCards < ActiveRecord::Migration
  def change
  	create_table :cards do |t|
  		t.string :suit
  		t.string :value
  		t.string :img_url

  		t.timestamps
  	end
  end
end
