class CreateWebinars < ActiveRecord::Migration[6.0]
  def change
    create_table :webinars do |t|
      t.string :name
      t.string :hashtag
      t.string :date
      t.string :speaker

      t.timestamps
    end
  end
end
