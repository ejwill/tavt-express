ThinkingSphinx::Index.define :car, :with => :active_record do
  indexes vin
  indexes make
  indexes model
  indexes trim
  indexes vid
end
