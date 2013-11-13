class AddTimestampsToSkipWords < ActiveRecord::Migration
  def change
    add_column(:skip_words, :created_at, :datetime)
    add_column(:skip_words, :updated_at, :datetime)
  end
end
