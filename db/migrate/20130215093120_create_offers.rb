class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :title
      t.string :payout
      t.string :thumbnail

      t.timestamps
    end
  end
end
