p Object.methods
p Object.singleton_methods
p Fixnum.singleton_methods

class MyClass
  def MyClass.my_singleton_method
  end

  def my_instance_method
  end
end
p MyClass.singleton_methods
p ''.methods == String.instance_methods
p MyClass.method_defined? :my_instance_method
p MyClass.new.respond_to? :my_instance_method #インスタンスに対してrespond_to?する
p MyClass.respond_to? :my_instance_method # クラス自身にはrespond_to?しても意味がない
p MyClass.respond_to? :my_singleton_method #でも特定のクラスが定義されているかどうかを調べるにはrespond_to?で良い
p String.private_instance_methods.sort # リストにはautoload?が含まれているが
p String.new.respond_to? :autoload?    # respond_to?で得られるとは限らず…
p String.new.autoload?                 # 当然使えるとも限らない。

# >> ["private_class_method", "inspect", "name", "tap", "clone", "public_methods", "object_id", "__send__", "method_defined?", "instance_variable_defined?", "equal?", "freeze", "extend", "send", "const_defined?", "methods", "ancestors", "module_eval", "instance_method", "hash", "autoload?", "dup", "to_enum", "instance_methods", "public_method_defined?", "instance_variables", "class_variable_defined?", "eql?", "constants", "instance_eval", "id", "module_exec", "singleton_methods", "const_missing", "taint", "instance_variable_get", "frozen?", "enum_for", "private_method_defined?", "public_instance_methods", "display", "instance_of?", "superclass", "method", "to_a", "included_modules", "const_get", "instance_exec", "type", "<", "protected_methods", "<=>", "class_eval", "==", "class_variables", ">", "===", "instance_variable_set", "protected_instance_methods", "protected_method_defined?", "respond_to?", "kind_of?", ">=", "public_class_method", "to_s", "<=", "const_set", "allocate", "class", "new", "private_methods", "=~", "tainted?", "__id__", "class_exec", "autoload", "untaint", "nil?", "private_instance_methods", "include?", "is_a?"]
# >> []
# >> ["induced_from"]
# >> ["my_singleton_method"]
# >> true
# >> true
# >> true
# >> false
# >> true
# >> ["Array", "Float", "Integer", "String", "__method__", "`", "abort", "at_exit", "autoload", "autoload?", "binding", "block_given?", "callcc", "caller", "catch", "eval", "exec", "exit", "exit!", "fail", "fork", "format", "getc", "gets", "global_variables", "initialize", "initialize_copy", "iterator?", "lambda", "load", "local_variables", "loop", "method_missing", "open", "p", "print", "printf", "proc", "putc", "puts", "raise", "rand", "readline", "readlines", "remove_instance_variable", "require", "set_trace_func", "singleton_method_added", "singleton_method_removed", "singleton_method_undefined", "sleep", "sprintf", "srand", "syscall", "system", "test", "throw", "trace_var", "trap", "untrace_var", "warn"]
# >> false
