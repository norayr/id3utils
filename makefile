VOC = /opt/voc/bin/voc


ALL:
	$(VOC) -s id3helper.Mod id3.Mod catID3Tags.Mod -m
