# models
class Diary < ActiveRecord::Base
end

#migrations
class CreateAllTables < ActiveRecord::Migration
  def self.up
    create_table(:gem_defined_models) { |t| t.string :title; t.text :context; t.datetime "created_at"; t.datetime "updated_at" }
    create_table(:diaries) {|t| t.string :title; t.text :context; t.datetime "created_at"; t.datetime "updated_at" }
  end
end
ActiveRecord::Migration.verbose = false
CreateAllTables.up
