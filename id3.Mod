MODULE id3;

IMPORT id3helper, Out := Console, Strings, Files;

CONST id3BufLen = 128;
      genresLen = 147;

TYPE
  string = id3helper.string;

  TID3Tag* = RECORD
    ID*: ARRAY 4 OF CHAR;
    Title*: string;
    Artist*: string;
    Album*: string;
    Year*: ARRAY 4 OF CHAR;
    Comment: string;
    Genre*: INTEGER;
  END;

VAR Genres* : ARRAY genresLen OF string;

PROCEDURE debugArray(VAR arr : ARRAY OF CHAR);
VAR
  i : INTEGER;
BEGIN
 i := 0;
 REPEAT
   Out.Int(i, 0); Out.String(": "); Out.Char(arr[i]); Out.Ln;
   INC(i)
 UNTIL i >= LEN(arr);
END debugArray;

PROCEDURE Extract(VAR src: ARRAY OF CHAR; pos, num: INTEGER; VAR dst: ARRAY OF CHAR);
VAR
  i, j : INTEGER;
BEGIN
  i := pos;
  j := 0;
  REPEAT
    dst[j] := src[i];
	INC(j); INC(i);
  UNTIL (j = LEN(dst) - 1) OR (src[i] = 0X);

  WHILE j < LEN(dst) - 1 DO
    dst[j] := 0X;
	INC(j)
  END
END Extract;

PROCEDURE readID3Tags*(fileName: ARRAY OF CHAR; VAR tag: TID3Tag);
VAR
  F: Files.File;
  R: Files.Rider;
  Buffer: ARRAY id3BufLen OF CHAR;
  len : LONGINT;
BEGIN
  F := Files.Old (fileName);
  IF F # NIL THEN
    len := Files.Length(F);
	Files.Set(R, F, len - id3BufLen);
	Files.ReadBytes(R, Buffer, id3BufLen)
  ELSE
    Out.String("file not found"); Out.Ln;
	HALT(1);
  END;
  (*debugArray(Buffer);*)
  Extract(Buffer, 0, 3, tag.ID);
  Extract(Buffer, 3, 29, tag.Title);
  Extract(Buffer, 33, 29, tag.Artist);
  Extract(Buffer, 63, 29, tag.Album);
  Extract(Buffer, 93, 3, tag.Year);
  Extract(Buffer, 97, 29, tag.Comment);
  tag.Genre := ORD(Buffer[127]);
  (* test *)
  Out.String("tag "); Out.String(tag.ID); Out.Ln;
  Out.String("title "); Out.String(tag.Title); Out.Ln;
  Out.String("artist "); Out.String(tag.Artist); Out.Ln;
  Out.String("album "); Out.String(tag.Year); Out.Ln;
  Out.String("genre "); Out.Int(tag.Genre, 0); Out.Ln


  (* end of test *)
END readID3Tags;                 

PROCEDURE InitGenresArray;
BEGIN
Genres[0] := 'Blues';
Genres[1] := 'Classic Rock';
Genres[2] := 'Country';
Genres[3] := 'Dance';
Genres[4] := 'Disco';
Genres[5] := 'Funk';
Genres[6] := 'Grunge';
Genres[7] := 'Hip- Hop';
Genres[8] := 'Jazz';
Genres[9] := 'Metal';
Genres[10] :=  'New Age';
Genres[11] := 'Oldies';
Genres[12] := 'Other';
Genres[13] := 'Pop';
Genres[14] := 'R&B';
Genres[15] := 'Rap';
Genres[16] := 'Reggae';
Genres[17] := 'Rock';
Genres[18] := 'Techno';
Genres[19] := 'Industrial';
Genres[20] := 'Alternative';
Genres[21] := 'Ska';
Genres[22] := 'Death Metal';
Genres[23] := 'Pranks';
Genres[24] := 'Soundtrack';
Genres[25] := 'Euro-Techno';
Genres[26] := 'Ambient';
Genres[27] := 'Trip-Hop';
Genres[28] := 'Vocal';
Genres[29] := 'Jazz+Funk';
Genres[30] := 'Fusion';
Genres[31] := 'Trance';
Genres[32] := 'Classical';
Genres[33] := 'Instrumental';
Genres[34] := 'Acid';
Genres[35] := 'House';
Genres[36] := 'Game';
Genres[37] := 'Sound Clip';
Genres[38] := 'Gospel';
Genres[39] := 'Noise';
Genres[40] := 'Alternative Rock';
Genres[41] := 'Bass';
Genres[42] := 'Punk';
Genres[43] := 'Space';
Genres[44] := 'Meditative';
Genres[45] := 'Instrumental Pop';
Genres[46] := 'Instrumental Rock';
Genres[47] := 'Ethnic';
Genres[48] := 'Gothic';
Genres[49] := 'Darkwave';
Genres[50] := 'Techno-Industrial';
Genres[51] := 'Electronic';
Genres[52] := 'Pop-Folk';
Genres[53] := 'Eurodance';
Genres[54] := 'Dream';
Genres[55] := 'Southern Rock';
Genres[56] := 'Comedy';
Genres[57] := 'Cult';
Genres[58] := 'Gangsta';
Genres[59] := 'Top 40';
Genres[60] := 'Christian Rap';
Genres[61] := 'Pop/Funk';
Genres[62] := 'Jungle';
Genres[63] := 'Native US';
Genres[64] := 'Cabaret';
Genres[65] := 'New Wave';
Genres[66] := 'Psychadelic';
Genres[67] := 'Rave';
Genres[68] := 'Showtunes';
Genres[69] := 'Trailer';
Genres[70] := 'Lo-Fi';
Genres[71] := 'Tribal';
Genres[72] := 'Acid Punk';
Genres[73] := 'Acid Jazz';
Genres[74] := 'Polka';
Genres[75] := 'Retro';
Genres[76] := 'Musical';
Genres[77] := 'Rock & Roll';
Genres[78] := 'Hard Rock';
Genres[79] := 'Folk';
Genres[80] := 'Folk-Rock';
Genres[81] := 'National Folk';
Genres[82] := 'Swing';
Genres[83] := 'Fast Fusion';
Genres[84] := 'Bebob';
Genres[85] := 'Latin';
Genres[86] := 'Revival';
Genres[87] := 'Celtic';
Genres[88] := 'Bluegrass';
Genres[89] := 'Avantgarde';
Genres[90] := 'Gothic Rock';
Genres[91] := 'Progressive Rock';
Genres[92] := 'Psychedelic Rock';
Genres[93]:= 'Symphonic Rock';
Genres[94] := 'Slow Rock';
Genres[95] := 'Big Band';
Genres[96] := 'Chorus';
Genres[97] := 'Easy Listening';
Genres[98] := 'Acoustic';
Genres[99] := 'Humour';
Genres[100] := 'Speech';
Genres[101] := 'Chanson';
Genres[102] := 'Opera';
Genres[103] := 'Chamber Music';
Genres[104] := 'Sonata';
Genres[105] := 'Symphony';
Genres[106] := 'Booty Bass';
Genres[107] := 'Primus';
Genres[108] := 'Porn Groove';
Genres[109] := 'Satire';
Genres[110] := 'Slow Jam';
Genres[111] := 'Club';
Genres[112] := 'Tango';
Genres[113] := 'Samba';
Genres[114] := 'Folklore';
Genres[115] := 'Ballad';
Genres[116] := 'Power Ballad';
Genres[117] := 'Rhytmic Soul';
Genres[118] := 'Freestyle';
Genres[119] := 'Duet';
Genres[120] := 'Punk Rock';
Genres[121] := 'Drum Solo';
Genres[122] := 'Acapella';
Genres[123] := 'Euro-House';
Genres[124] := 'Dance Hall';
Genres[125] := 'Goa';
Genres[126] := 'Drum & Bass';
Genres[127] := 'Club-House';
Genres[128] := 'Hardcore';
Genres[129] := 'Terror';
Genres[130] := 'Indie';
Genres[131] := 'BritPop';
Genres[132] := 'Negerpunk';
Genres[133] := 'Polsk Punk';
Genres[134] := 'Beat';
Genres[135] := 'Christian Gangsta';
Genres[136] := 'Heavy Metal';
Genres[137] := 'Black Metal';
Genres[138] := 'Crossover';
Genres[139] := 'Contemporary C';
Genres[140] := 'Christian Rock';
Genres[141] := 'Merengue';
Genres[142] := 'Salsa';
Genres[143] := 'Thrash Metal';
Genres[144] := 'Anime';
Genres[145] := 'JPop';
Genres[146] := 'SynthPop';


END InitGenresArray;

BEGIN
InitGenresArray;

END id3.

