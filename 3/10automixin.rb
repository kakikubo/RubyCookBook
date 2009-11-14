p Array.included_modules

class Class
  alias_method :old_new, :new
  def new(*args, &block)
    obj = old_new(*args, &block)
    self.included_modules.each do |mod|
      mod.initialize if mod.respond_to?(:initialize)
    end
    obj
  end
end

module A
  def self.initialize
    puts "A's initialized."
  end
end

module B
  def self.initialize
    puts "B's initialized."
  end
end

class BothAAndB
  include A
  include B
end

p BothAAndB.included_modules
both = BothAAndB.new
# >> [Enumerable, Kernel]
# >> [B, A, Kernel]
# >> B's initialized.
# >> A's initialized.
