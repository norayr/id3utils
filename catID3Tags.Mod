MODULE catID3Tags;

IMPORT id3, Out := Console;

VAR tag : id3.TID3Tag;

BEGIN

id3.readID3Tags("test.mp3", tag);

Out.String(tag.ID); Out.Ln;
Out.String(tag.Title); Out.Ln;
Out.String(tag.Artist); Out.Ln;
Out.String(tag.Album); Out.Ln;
Out.String(tag.Year); Out.Ln;
Out.Int(tag.Genre, 0); Out.Ln;

END catID3Tags.
