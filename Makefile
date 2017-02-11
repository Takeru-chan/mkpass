all:
	cp -p mkpass.swift main.swift
	xcrun -sdk macosx swiftc -o mkpass main.swift ./GenerateMember/GenerateMember.swift ./CheckOption/CheckOption.swift ./Devices/Devices.swift
	rm main.swift
