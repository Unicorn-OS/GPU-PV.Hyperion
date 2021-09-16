# Solution!

Adam Reynolds
April 24, 2021 at 5:26 am
To select a specific adapter, you can use the command Get-VMHostPartitionableGpu to get the adapter’s ID, then add it explicitly with:

`Add-VMGpuPartitionAdapter -InstancePath [adapter ID from above]`

E.g., on my system I have the onboard Radeon GPU + an RTX 2060, so I get the following for Get-VMHostPartitionableGpu (output truncated for readability):
```
PS C:\Users\a> Get-VMHostPartitionableGpu

Name : \\?\PCI#VEN_1002&DEV_1636&SUBSYS_1F111043&REV_C5#4&12c9051d&0&0041#{064092b3-625e-43bf-9eb5-dc845897dd59}\gpuparav
ValidPartitionCounts : {32}
PartitionCount : 32

Name : \\?\PCI#VEN_10DE&DEV_1F12&SUBSYS_1F111043&REV_A1#4&21cf790e&0&0009#{064092b3-625e-43bf-9eb5-dc845897dd59}\GPUPARAV
ValidPartitionCounts : {32}
PartitionCount : 32
```
The first entry is the Radeon onboard graphics, so this gets added if you just run Add-VMGpuPartitionAdapter without any arguments. `Name` in the output above is the `InstanceId` for the Add-VMGpuPartitionAdapter command.

Tested this on my dual-GPU machine and I was able to get my choice of GPU assigned to the VM and working.

- from: https://mu0.cc/2020/08/25/hyperv-gpupv/#comment-12
