mkdir=@mkdir -p $(@D)


build/main: build/libmyconcat.a src/main.cpp
	clang++ $^ -o $@

build/name_a/core.o: lib/core.cpp
	$(mkdir)
	clang++ $< -o $@ -DLIBNS=name_a -c

build/name_a/sub.o: lib/sub.cpp
	$(mkdir)
	clang++ $< -o $@ -DLIBNS=name_a -c

build/name_b/core.o: lib/core.cpp
	$(mkdir)
	clang++ $< -o $@ -DLIBNS=name_b -c

build/name_b/sub.o: lib/sub.cpp
	$(mkdir)
	clang++ $< -o $@ -DLIBNS=name_b -c

build/libmya.a: build/name_a/core.o build/name_a/sub.o
	ar rcs $@ $^

build/libmyb.a: build/name_b/core.o build/name_b/sub.o
	ar rcs $@ $^

build/libmyconcat.a: build/libmya.a build/libmyb.a
# 中身のファイル名が重複する.aファイルがあったときに、それらをリネームして1つに結合
	rm -r build/obja || true
	mkdir -p build/obja
	sh -c 'cd build/obja && ar x ../libmya.a && for file in *; do mv "$$file" "name_a_$$file"; done'
	rm -r build/objb || true
	mkdir -p build/objb
	sh -c 'cd build/objb && ar x ../libmyb.a && for file in *; do mv "$$file" "name_b_$$file"; done'
	ar rcs build/libmyconcat.a build/obja/*.o build/objb/*.o
