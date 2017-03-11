all:
	cp -p test-Password.swift main.swift
ifeq ($(shell uname),Linux)
	swiftc -o test-Password.rpi main.swift Password.swift
else
	xcrun -sdk macosx swiftc -o test-Password main.swift Password.swift
endif
	rm main.swift
