require 'active_record/connection_adapters/mysql2_adapter'

class ActiveRecord::ConnectionAdapters::Mysql2Adapter
  NATIVE_DATABASE_TYPES[:primary_key] = "int(11) auto_increment PRIMARY KEY" #We need this for db:migrate to be able to create tables properly in MySQL, or it complains about primary keys being nullable.
end
