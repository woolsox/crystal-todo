class Task < Granite::Base
  adapter pg
  table_name tasks

  primary id : Int64
  field task : String
  field description : String
  field status : String, default: "Incomplete"
  timestamps
end
