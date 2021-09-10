class ChangeReferencesInBookmarks < ActiveRecord::Migration[6.0]
  def change
    remove_reference :bookmarks, :movie, index: true
    remove_reference :bookmarks, :list, index: true
  end
end
