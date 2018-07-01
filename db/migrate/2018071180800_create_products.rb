class CreateProducts < ActiveRecord::Migration[4.2]
	def change
		create_table :products do |t|
			t.string :name 
			t.string :url
			t.text :description


			t.timestamps null: false
		end
	end

end
