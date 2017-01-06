json.extract! keep, :id, :title, :completed, :completed_at, :started, :started_at, :deleted, :deleted_at, :makro_id, :created_at, :updated_at

json.url keep_url(keep, format: :json)

json.makro keep.makro

json.makro_url makro_url(keep.makro) if keep.makro