class CreateSportsGifs < ActiveRecord::Migration
  def change
    create_table :sports_gifs do |t|
    	t.string :category
    	t.string :image_url
    	t.string :content
    	t.string :author

    	t.timestamps
    end
  end
end
