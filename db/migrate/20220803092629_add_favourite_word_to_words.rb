class AddFavouriteWordToWords < ActiveRecord::Migration[7.0]
  def change
    add_column :words, :favourite, :string
  end
end
