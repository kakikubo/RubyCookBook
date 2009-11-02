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

f1 = Factory.new
WidgetCounter.new(f1)
f1.produce_widget("red")
f1.produce_widget("green")
f1.produce_widget("red")
Factory.new.produce_widget("blue")
# TODO!!! ここはもう一度明日やる事にしよう！！！
# >> 1 red widget(s) created since I started watching.
# >> 1 green widget(s) created since I started watching.
# >> 2 red widget(s) created since I started watching.
