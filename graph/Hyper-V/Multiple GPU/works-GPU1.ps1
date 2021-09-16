# Nvidia RTX 2060 Super
$vm = "Windows-10-Enterprise"

$gpu1 = "\\?\PCI#VEN_10DE&DEV_1F06&SUBSYS_87181043&REV_A1#4&296eb0ef&0&0008#{064092b3-625e-43bf-9eb5-dc845897dd59}\GPUPARAV"

Remove-VMGpuPartitionAdapter -VMName $vm
Add-VMGpuPartitionAdapter -VMName $vm

Set-VMPartitionableGpu -Name $gpu1 -PartitionCount 1
Set-VM -GuestControlledCacheTypes $true -VMName $vm
Set-VM -LowMemoryMappedIoSpace 3GB -VMName $vm
Set-VM -HighMemoryMappedIoSpace 32GB -VMName $vm

Start-VM -Name $vm
