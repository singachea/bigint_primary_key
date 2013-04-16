require "bigint_primary_key/version"

module BigintPrimaryKey
  extend ActiveSupport::Concern

	module ClassMethods
	end

	def add_bigint_primary_key t_name, pk_name = :id
		add_column t_name.to_sym, pk_name.to_sym, :primary_key
		alter_bigint_primary_key(t_name, pk_name)
	end

	def alter_bigint_primary_key t_name, pk_name = :id
		alter_db_primary_key(get_adapter_type, t_name, pk_name)
	end

	private
	def alter_db_primary_key db_type, t_name, pk_name = :id
		if db_type.to_s == "postgresql"
			change_column t_name, pk_name, :bigint
		elsif db_type.to_s == "mysql"
			execute "ALTER TABLE #{t_name.to_s} MODIFY #{pk_name.to_s} BIGINT NOT NULL AUTO_INCREMENT"	
		else
			raise Exception,"Unsupported database adapter (#{db_type})"
		end
	end

	def get_adapter_type
		adapter = ActiveRecord::Base.configurations[Rails.env]['adapter']
		if adapter =~ /postgresql/i  
		  "postgresql"
		elsif adapter =~ /mysql/i
			"mysql"
		else
			nil
		end
	end
end

ActiveRecord::Migration.send(:include, BigintPrimaryKey)
