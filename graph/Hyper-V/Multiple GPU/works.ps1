$vm = "Windows-10-Enterprise"

# Nvidia 2060 Super
$gpu1 = "\\?\PCI#VEN_10DE&DEV_1381&SUBSYS_107310DE&REV_A2#4&2c577141&0&00E4#{064092b3-625e-43bf-9eb5-dc845897dd59}\GPUPARAV"

Remove-VMGpuPartitionAdapter -VMName $vm
Set-VMPartitionableGpu -Name $gpu1 -PartitionCount 1
Set-VM -GuestControlledCacheTypes $true -VMName $vm
Set-VM -LowMemoryMappedIoSpace 3GB -VMName $vm
Set-VM -HighMemoryMappedIoSpace 32GB -VMName $vm
Add-VMGpuPartitionAdapter -VMName $vm
Start-VM -Name $vm
