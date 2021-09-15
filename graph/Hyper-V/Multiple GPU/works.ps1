# Nvidia RTX 2060 Super
$vm = "Windows-10-Enterprise"

$gpu1 = "\\?\PCI#VEN_10DE&DEV_1F06&SUBSYS_87181043&REV_A1#4&296eb0ef&0&0008#{064092b3-625e-43bf-9eb5-dc845897dd59}\GPUPARAV"

Remove-VMGpuPartitionAdapter -VMName $vm
Set-VMPartitionableGpu -Name $gpu1 -PartitionCount 1
Set-VM -GuestControlledCacheTypes $true -VMName $vm
Set-VM -LowMemoryMappedIoSpace 3GB -VMName $vm
Set-VM -HighMemoryMappedIoSpace 32GB -VMName $vm
Add-VMGpuPartitionAdapter -VMName $vm
Start-VM -Name $vm


# Nvidia GTX 750
$vm2 = "WindowsMiner"

$gpu2 = "\\?\PCI#VEN_10DE&DEV_1381&SUBSYS_107310DE&REV_A2#4&2c577141&0&00E4#{064092b3-625e-43bf-9eb5-dc845897dd59}\GPUPARAV"

Remove-VMGpuPartitionAdapter -VMName $vm2
Set-VMPartitionableGpu -Name $gpu2 -PartitionCount 1
Set-VM -GuestControlledCacheTypes $true -VMName $vm2
Set-VM -LowMemoryMappedIoSpace 3GB -VMName $vm2
Set-VM -HighMemoryMappedIoSpace 32GB -VMName $vm2
Add-VMGpuPartitionAdapter -VMName $vm2
Start-VM -Name $vm2

# Nvidia GTX 1080 3GB
$vm3 = "WindowsMiner"

$gpu3 = "\\?\PCI#VEN_10DE&DEV_1C02&SUBSYS_61623842&REV_A1#4&2c577141&0&00E4#{064092b3-625e-43bf-9eb5-dc845897dd59}\GPUPARAV"

Remove-VMGpuPartitionAdapter -VMName $vm3
Set-VMPartitionableGpu -Name $gpu3 -PartitionCount 1
Set-VM -GuestControlledCacheTypes $true -VMName $vm3
Set-VM -LowMemoryMappedIoSpace 3GB -VMName $vm3
Set-VM -HighMemoryMappedIoSpace 32GB -VMName $vm3
Add-VMGpuPartitionAdapter -VMName $vm3
Start-VM -Name $vm3
