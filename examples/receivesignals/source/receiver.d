import dqml;
import sender;
import std.stdio;

class Receiver : QObject
{
    mixin Q_OBJECT;

	public void register(Sender sender)
	{
		connect!receive(sender, "broadcast");
	}

	@QtSlot()
	public void receive(string message)
	{
		writeln("Received \"" ~ message ~ "\"");
	}
}
