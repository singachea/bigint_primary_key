# BigintPrimaryKey

This is a simple gem to create big integer primary key for mysql and postgresql so that the auto increment is intact.

## Installation

Add this line to your application's Gemfile:

    gem 'bigint_primary_key'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bigint_primary_key

## Usage

You can use it in your migration file. 

(create table without id)
```ruby
class CreateCakes < ActiveRecord::Migration
  def change
    create_table :cakes, id: false do |t|
      t.string :name

      t.timestamps
    end

    add_bigint_primary_key :cakes, :id
  end

end
```

(create table with default id)
```ruby
class CreateCakes < ActiveRecord::Migration
  def change
    create_table :cakes do |t|
      t.string :name

      t.timestamps
    end

    alter_bigint_primary_key :cakes, :id
  end
end
```

You can leave `id` out if you have default setting. `add_bigint_primary_key :cakes` and `alter_bigint_primary_key :cakes`


Here are the method definitions:
```ruby
def add_bigint_primary_key t_name, pk_name = :id
	...
end

def alter_bigint_primary_key t_name, pk_name = :id
	...
end
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
