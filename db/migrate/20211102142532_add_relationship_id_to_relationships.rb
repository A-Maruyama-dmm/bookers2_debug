class AddRelationshipIdToRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :relationship_id, :integer
  end
end
