# def between_setup_and_cleanup
#   setup
#   begin
#     yield
#   ensure
#     cleanup
#   end
# end

def write_html(out, doctype=nil)
  doctype ||= %{<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">}
  out.puts doctype
  out.puts '<html>'
  begin
    yield out
  ensure
    out.puts '</html>'
  end
end

write_html($stdout) do |out|
  out.puts '<h1>Sorry, the web is closed.</h1>'
end

open('output.txt', 'w') do |out|
  out.puts 'Sorry, the filesystem is also closed'
end

# >> <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
# >>     "http://www.w3.org/TR/html4/loose.dtd">
# >> <html>
# >> <h1>Sorry, the web is closed.</h1>
# >> </html>
