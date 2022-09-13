# install diffvg
%cd /content/LIVE/DiffVG
import torch
import os
gpu_name = torch.cuda.get_device_name(0)
print(gpu_name)
if "K80" in gpu_name:
  replace_str = 's/set(CUDA_NVCC_FLAGS "\${CUDA_NVCC_FLAGS} -std=c++11")/set(CUDA_NVCC_FLAGS "\${CUDA_NVCC_FLAGS} -std=c++14 -gencode=arch=compute_37,code=sm_37")/gi'
  replace_str = "sed -i '"+replace_str+ "' CMakeLists.txt"
  os.system(replace_str)
  print("change cmake for K80")
elif "T4" in gpu_name:
  replace_str = 's/set(CUDA_NVCC_FLAGS "\${CUDA_NVCC_FLAGS} -std=c++11")/set(CUDA_NVCC_FLAGS "\${CUDA_NVCC_FLAGS} -std=c++14 -gencode=arch=compute_75,code=sm_75")/gi'
  replace_str = "sed -i '"+replace_str+ "' CMakeLists.txt"
  os.system(replace_str)
  print("change cmake for T4")
