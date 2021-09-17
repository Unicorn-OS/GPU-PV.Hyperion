# Quote
## Partitioning a Render Only GPU
Render only GPU drivers do not have display outputs attached to them. This is commonly the case with “compute-only” GPUs, such as NVIDIA Tesla and AMD Radeon Instinct. However, these GPUs are also common on laptops with NVIDIA Optimus configuration, where the NVIDIA is the render only device. Testing GPU-PV on such GPUs (all tested are NVIDIA Optimus GPUs) on the released version of Windows 10 (version 2004 as of this writing) resulted in guest’s graphics stuck. Guest’s CPU still responds normally, and the guest responds to remote desktop requests as well (remote desktop has to have graphics acceleration disabled). Connecting to a remote desktop with graphics acceleration doesn’t work, and neither does attaching an indirect display (IddCx) to the partitioned GPU. Windows Sandbox on Windows 10 version 2004 also crashes when used with such GPUs.

Guest with NVIDIA GeForce GTX 1050 running Unigine Heaven

However, in the latest version of Windows 10 “Iron” insider preview (build 20197 as of this writing), GPU-PV on such GPUs works. The only caveat is that the display output cannot be seen from the built-in Hyper-V video driver: we have to use either a graphic accelerated RDP (which is always the case when we use the Hyper-V’s enhanced session mode) or IddCx drivers. More things regarding IddCx will warrant a separate post :), however, my favorite IddCx driver right now is SpaceDesk, which will stream whatever displayed on the driver over IP.

- from: https://mu0.cc/2020/08/25/hyperv-gpupv/#renderonly
- relation: https://docs.microsoft.com/en-us/windows-hardware/drivers/display/indirect-display-driver-model-overview, https://www.spacedesk.net/
