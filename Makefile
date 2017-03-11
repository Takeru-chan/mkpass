all:
	cp -p mkpass.swift main.swift
ifeq ($(shell uname),Linux)
	swiftc -o mkpass.rpi main.swift ./Condition/Condition.swift ./Devices/Devices.swift ./Password/Password.swift
else
	xcrun -sdk macosx swiftc -o mkpass main.swift ./Condition/Condition.swift ./Devices/Devices.swift ./Password/Password.swift
endif
	rm main.swift
