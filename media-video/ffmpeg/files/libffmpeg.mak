$(SLIBPREF)ffmpeg$(SLIBSUF): libavcodec/$(LIBPREF)avcodec$(LIBSUF) libavformat/$(LIBPREF)avformat$(LIBSUF) libavutil/$(LIBPREF)avutil$(LIBSUF) libswresample/$(LIBPREF)swresample$(LIBSUF)
	$(LD) -shared -Wl,-soname,$@ -Wl,-Bsymbolic -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -Wl,--gc-sections $(LDFLAGS) $(LDLIBFLAGS) $(LD_O) -Wl,--whole-archive $^ -Wl,--no-whole-archive $(FFEXTRALIBS)

libffmpeg: $(SLIBPREF)ffmpeg$(SLIBSUF)

install-libffmpeg: $(SLIBPREF)ffmpeg$(SLIBSUF)
	$(Q)mkdir -p "$(SHLIBDIR)/chromium"
	$(INSTALL) -m 755 $< "$(SHLIBDIR)/chromium/$<"
	$(STRIP) "$(SHLIBDIR)/chromium/$<"

.PHONY: libffmpeg install-libffmpeg
