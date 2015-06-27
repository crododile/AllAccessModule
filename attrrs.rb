class NoAccessor

  def initialize
    @test = "testy"
    create_readers
    create_writers
  end
  
  def create_readers
    instance_variables.map do |iv|
      [iv.to_s.gsub("@",'').to_sym, iv.to_s]
    end.each do |iv|
      define_singleton_method iv[0].to_sym, lambda { eval(iv[1]) }
    end
  end
  
  def create_writers
    instance_variables.map do |iv|
      [iv.to_s.gsub("@",'').to_sym, iv.to_s]
    end.each do |iv|
      define_singleton_method "#{iv[0]}=".to_sym, lambda {|assignment|
        if assignment.class == String
         eval "#{iv[1]} = '#{assignment}'"
        else
         eval "#{iv[1]} = #{assignment}"
        end
        }
    end
  end
end


