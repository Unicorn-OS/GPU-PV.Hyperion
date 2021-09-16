
# if Multiple GPUs
https://www.google.com/search?q=Add-VMGpuPartitionAdapter+multiple+gpu




*Solution: Increment PartitionCount by 1 for each GPU!*  

```
$gpu1 = "\\?\PCI#VEN_10DE&DEV_1C02&SUBSYS_61623842&REV_A1#4&2c577141&0&00E4#{064092b3-625e-43bf-9eb5-dc845897dd59}\GPUPARAV"
$gpu2 = "\\?\PCI#VEN_10DE&DEV_1C03&SUBSYS_32811462&REV_A1#4&296eb0ef&0&0008#{064092b3-625e-43bf-9eb5-dc845897dd59}\GPUPARAV"

## Incrementing "PartitionCount" is the Solution!!
Set-VMPartitionableGpu -Name $gpu1 -PartitionCount 1
Set-VMPartitionableGpu -Name $gpu2 -PartitionCount 2
```

https://www.reddit.com/r/HyperV/comments/i25azl/gpu_partition_with_hyperv_on_server_2019/

## Get GPU.Name

```
$gpup = Get-VMPartitionableGpu
echo $gpup.Name
```

## help
```
help Add-VMGpuPartitionAdapter
```

## example use:
```
Remove-VMGpuPartitionAdapter -VMName $vm
Set-VMPartitionableGpu -Name $gpup.Name
```
