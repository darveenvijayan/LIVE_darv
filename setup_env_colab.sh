git clone https://github.com/ma-xu/LIVE.git
cd LIVE

# change gcc version to 5.5
apt-get install -qq gcc-5 g++-5 -y
ln -s /usr/bin/gcc-5 /usr/local/cuda/bin/gcc;
ln -s /usr/bin/g++-5 /usr/local/cuda/bin/g++;

gcc -v # ensure gcc version is 5.5

# remove tensorflow for install
pip3 uninstall tensorflow -y

# install required libs
# !pip install torch==1.9.0+cu111 torchtext==0.10.0 torchvision==0.10.0+cu111 -f https://download.pytorch.org/whl/torch/ -f https://download.pytorch.org/whl/torchvision/
# !pip install torch==1.7.0+cu110 torchvision==0.8.1+cu110 -f https://download.pytorch.org/whl/torch_stable.html
pip3 install svgwrite svgpathtools cssutils numba torch-tools scikit-fmm easydict visdom
pip3 install numpy scikit-image ffmpeg opencv-python==4.5.4.60
pip3 install cmake==3.18.2
pip uninstall imgaug -y && pip uninstall albumentations -y && pip install git+https://github.com/aleju/imgaug.git -y
pip3 install -U PyYAML

sudo apt-get install -y libsdl2-image-dev
git submodule update --init --recursive
python3 setup.py install
cd ..
