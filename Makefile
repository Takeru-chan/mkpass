all:
	cp -p mkpass.swift main.swift
	xcrun -sdk macosx swiftc -o mkpass main.swift ./Condition/Condition.swift ./Devices/Devices.swift
	rm main.swift
