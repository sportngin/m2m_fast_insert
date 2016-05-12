module M2MFastInsert
  module HasAndBelongsToManyOverride
    # Decorate the original habtm to call our method definition
    #
    # name - Plural name of the model we're associating with
    # options - see ActiveRecord docs
    def has_and_belongs_to_many(name, options = {})
      super
      define_fast_methods_for_model(name, options)
    end

    private
    # Get necessary table and column information so we can define
    # fast insertion methods
    #
    # name - Plural name of the model we're associating with
    # options - see ActiveRecord docs
    def define_fast_methods_for_model(name, options)
      join_table = options[:join_table]
      join_column_name = name.to_s.downcase.singularize
      define_method "fast_#{join_column_name}_ids_insert" do |*args|
        table_name = self.class.table_name.singularize
        insert = M2MFastInsert::Base.new id, join_column_name, table_name, join_table, *args
        insert.fast_insert
      end
    end
  end
end

ActiveRecord::Base.send :extend, M2MFastInsert::HasAndBelongsToManyOverride
