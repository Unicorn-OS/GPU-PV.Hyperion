
# if Multiple GPUs
https://www.google.com/search?q=Add-VMGpuPartitionAdapter+multiple+gpu


*Solution:*  
https://www.reddit.com/r/HyperV/comments/i25azl/gpu_partition_with_hyperv_on_server_2019/

```Get-VMPartitionableGpu

$gpu1 = "\\?\PCI#VEN_10DE&DEV_1381&SUBSYS_107310DE&REV_A2#4&2c577141&0&00E4#{064092b3-625e-43bf-9eb5-dc845897dd59}\GPUPARAV"

Set-VMPartitionableGpu -Name $gpu1 -PartitionCount 1
```

## Get GPU.Name

```
$gpup = Get-VMPartitionableGpu
echo $gpup.Name
```

## example use:
```
Remove-VMGpuPartitionAdapter -VMName $vm
Set-VMPartitionableGpu -Name $gpup.Name
```
