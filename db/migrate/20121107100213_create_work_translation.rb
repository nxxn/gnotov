class CreateWorkTranslation < ActiveRecord::Migration
  def up
    Work.create_translation_table!({
      description: :text
    }, {
      migrate_data: true
    })
  end

  def down
    Work.drop_translation_table! migrate_data: true
  end
end
