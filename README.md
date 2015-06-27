# AllAccess
don't write attr_accessor

You have a class that is really just a bag of data, and I wanted to access the attributes with dot notation a'la javascript

Yes this is unnecessary

Usage:
```Ruby
class Accessible
  include AllAccess

  def initialize
    @test = "testy"
  end
end

accessible = Accessible.new
accessible.test # "testy"
accessible.test = "bacon"
accessible.test # "bacon"
```
