$vm = "Windows-10-Enterprise"
$vm2 = "WindowsMiner"


$gpu1 = "\\?\PCI#VEN_10DE&DEV_1C03&SUBSYS_32811462&REV_A1#4&2c577141&0&00E4#{064092b3-625e-43bf-9eb5-dc845897dd59}\GPUPARAV"
$gpu2 = "\\?\PCI#VEN_10DE&DEV_1F06&SUBSYS_87181043&REV_A1#4&296eb0ef&0&0008#{064092b3-625e-43bf-9eb5-dc845897dd59}\GPUPARAV"


# Solution:
## Incrementing "PartitionCount" is the Solution!!
Set-VMPartitionableGpu -Name $gpu1 -PartitionCount 3
Set-VMPartitionableGpu -Name $gpu2 -PartitionCount 3


# Set Instances
Remove-VMGpuPartitionAdapter -VMName $vm
Remove-VMGpuPartitionAdapter -VMName $vm2

Add-VMGpuPartitionAdapter -VMName $vm
Add-VMGpuPartitionAdapter -VMName $vm2

Set-VMGpuPartitionAdapter -VMName $vm -MinPartitionVRAM 80000000 -MaxPartitionVRAM 100000000 -OptimalPartitionVRAM 100000000 -MinPartitionEncode 80000000 -MaxPartitionEncode 100000000 -OptimalPartitionEncode 100000000 -MinPartitionDecode 80000000 -MaxPartitionDecode 100000000 -OptimalPartitionDecode 100000000 -MinPartitionCompute 80000000 -MaxPartitionCompute 100000000 -OptimalPartitionCompute 100000000
Set-VMGpuPartitionAdapter -VMName $vm2 -MinPartitionVRAM 80000000 -MaxPartitionVRAM 100000000 -OptimalPartitionVRAM 100000000 -MinPartitionEncode 80000000 -MaxPartitionEncode 100000000 -OptimalPartitionEncode 100000000 -MinPartitionDecode 80000000 -MaxPartitionDecode 100000000 -OptimalPartitionDecode 100000000 -MinPartitionCompute 80000000 -MaxPartitionCompute 100000000 -OptimalPartitionCompute 100000000

Set-VM -GuestControlledCacheTypes $true -VMName $vm
Set-VM -GuestControlledCacheTypes $true -VMName $vm2

Set-VM -LowMemoryMappedIoSpace 1Gb -VMName $vm
Set-VM -LowMemoryMappedIoSpace 1Gb -VMName $vm2

Set-VM -HighMemoryMappedIoSpace 32GB -VMName $vm
Set-VM -HighMemoryMappedIoSpace 32GB -VMName $vm2
