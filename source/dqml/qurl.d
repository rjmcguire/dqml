module dqml.qurl;

import dqml.dothersideinterface;
import std.string;

class QUrl
{
    this(string url, ParsingMode parsingMode = ParsingMode.TolerantMode)
    {
        this.vptr = dos_qurl_create(url.toStringz(), parsingMode);
    }

    ~this()
    {
        dos_qurl_delete(this.vptr);
    }

    enum ParsingMode : int
    {
        TolerantMode = 0,
        StrictMode,
        DecodedMode
    }

    public void* voidPointer()
    {
        return this.vptr;
    }

    override string toString()
    {
        char* array = dos_qurl_to_string(vptr);
        string result = fromStringz(array).dup;
        dos_chararray_delete(array);
        return result;
    }

    private void* vptr;
}
