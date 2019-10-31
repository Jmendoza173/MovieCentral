class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :originT
      t.string :imdb_id
      t.string :homepage
      t.string :original_language
      t.string :overview
      t.string :poster_path
      t.bigint :budget
      t.bigint :revenue
      t.integer :runtime
      t.date :releasedate

      t.timestamps
    end
  end
end
