class Task < Granite::Base
  adapter pg
  table_name tasks

  primary id : Int64
  field task : String
  field description : String
  timestamps
end
