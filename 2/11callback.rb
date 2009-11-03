module EventDispatcher
  def setup_listeners
    @event_dispatcher_listeners = {}
  end

  def subscribe(event, &callback)
    (@event_dispatcher_listeners[event] ||= []) << callback
  end

  protected
  def notify(event, *args)
    if @event_dispatcher_listeners[event]
      @event_dispatcher_listeners[event].each do |m|
        # yield(m.call(*args)) if m.respond_to? :call <- p.69に記載しているこっちだとエラーになってしまう。
        m.call(*args) if m.respond_to? :call
      end
    end
    return nil
  end
end

class Factory
  include EventDispatcher

  def initialize
    setup_listeners
  end

  def produce_widget(color)
    #ウィジェットを作成するコード…
    notify(:new_widget, color)
  end
end

class WidgetCounter
  def initialize(factory)
    @counts = Hash.new(0)
    factory.subscribe(:new_widget) do |color|
      @counts[color] += 1
      puts "#{@counts[color]} #{color} widget(s) created since I started watching."
    end
  end
end

class Portal
  include EventDispatcher

  def initialize
    setup_listeners
  end

  def render
    puts '<table>'
    render_block = Proc.new { |box| puts " <td>#{box}</td>"}
    [:row1, :row2].each do |row|
      puts ' <tr>'
      notify(row, &render_block)
      puts ' </tr>'
    end
    puts '</table>'
  end
end
# TODO この構造は今ひとつまだ理解できていない
f1 = Factory.new
WidgetCounter.new(f1)
f1.produce_widget("red")
f1.produce_widget("green")
f1.produce_widget("red")
Factory.new.produce_widget("blue")

# TODO こっちはうまくいってない↓
portal = Portal.new
portal.subscribe(:row1){ 'Stock Ticker'}
portal.subscribe(:row1){ 'Weather'}
portal.subscribe(:row2){ 'Pointless, Trivial News'}
portal.render


# >> 1 red widget(s) created since I started watching.
# >> 1 green widget(s) created since I started watching.
# >> 2 red widget(s) created since I started watching.
# >> <table>
# >>  <tr>
# >>  </tr>
# >>  <tr>
# >>  </tr>
# >> </table>
