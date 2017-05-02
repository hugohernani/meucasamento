# Sets up logging - should only be called from other rake tasks
task setup_logger: :environment do
  logger           = Logger.new(STDOUT)
  logger.level     = Logger::INFO
  Rails.logger     = logger
end


namespace :adjustments do
  desc 'it does some adjustments'
  task reset_counters: :setup_logger do
    model_names = ApplicationRecord.descendants.map{ |d| d.name.underscore.pluralize }
    models = ApplicationRecord.descendants.select do |m|
      m.column_names.any? do |c|
        model_names.any?{ |model_name| c == "#{model_name}_count" }
      end
    end

    models.each do |model|
      has_many_associations = model.reflections.select do |k, v|
        v.is_a? ActiveRecord::Reflection::HasManyReflection
      end.keys

      model.find_each do |m|
        has_many_associations.each do |association|
          model.reset_counters(m.id, association.to_sym)
        end
      end
    end
  end
end
