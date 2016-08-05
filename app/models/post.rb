class Post < ActiveRecord::Base
	belongs_to :category
	def change
		create_table :posts do |t|
		  t.string :title
		  t.date :body
		end
	end
end
