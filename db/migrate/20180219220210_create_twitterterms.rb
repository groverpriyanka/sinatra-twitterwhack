class CreateTwitterterms < ActiveRecord::Migration[5.1]
  def up
		create_table :twitterterms do |t|
			t.string :first_search_word
			t.string :second_search_word
			t.integer :score
			t.integer :index
		end

	end

	def down
		drop_table :twitterterms
	end

end
