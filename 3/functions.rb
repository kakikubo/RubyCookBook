# module Decidable
#   # methodがいぱーい
# end

# module Semidecidable
#   # methodがいぱーい
# end

# ↑これだとメモリを食いすぎる。そこでautoload
autoload :Decidable, "decidable.rb"
autoload :Semidecidable, "semidecidable.rb"

