{
	hardware.graphics = {
		enable = true;
	};

	services.xserver.videoDrivers = ["nvidia"];
	hardware.nvidia.modesetting.enable = true;
	hardware.nvidia.open = true;

	hardware.nvidia.prime = {
		sync.enable = true;
		amdgpuBusId = "PCI:5:0:0";
		nvidiaBusId = "PCI:1:0:0";
	};
}
