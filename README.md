# MF-LIME
**基于Retinex模型和多尺度融合的低光照图像增强技术**

**Low-light image enhancement technology based on Retinex model and multi-scale fusion**

![](https://img.shields.io/badge/MATLAB-R2020b-green.svg)  **实验环境**

***

本项目基于Zhang等人[《A New Underwater Image Enhancing Method via Color Correction and Illumination Adjustment》](https://github.com/zhangwenhao123/VCIP2017)论文中提出的**亮度调整**流程和Codruta O. Ancuti等人[《Color Balance and Fusion for Underwater Image Enhancement》](https://ieeexplore.ieee.org/document/8058463)论文中提出的**多尺度融合**框架相结合的低光照图像增强技术。

## Abstract
提出了一种亮度调整、锐化和多尺度融合相结合的算法。首先对原图像分解出光照图，基于Retinex模型进行估计，并进行伽马矫正，得到亮度均衡的图像；为补偿伽马矫正导致过曝区域的细节丢失，对原图像进行锐化处理，以提升图像细节部分；最后在多尺度融合金字塔模型下，根据计算两个输入图像的权重进行多尺度融合，得到最终的增强图像。此外，还计算了五个非参考图像质量评价指标（BRISQUE，CEIQ，ENIQA，NIQE，PIQE）。

***

## 项目文件说明
- `main.m`：本项目主程序入口，处理一张图像，并计算五个非参考图像质量评价指标。
- `IQA_data.m`：本项目处理一个数据集的图像，并计算五个非参考图像质量评价指标平均值。

### Datasets
- [DICM数据集](http://mcl.korea.ac.kr/projects/LDR/LDR_TEST_IMAGES_DICM.zip) ，共69张图像，只选取了前44张低光照图像。
- [Fusion数据集](https://xueyangfu.github.io/projects/sp2016.html) ，16张低光照图像。
- [LIME数据集](https://sites.google.com/view/xjguo/lime) ，10张低光照图像。
- [VV数据集](https://drive.google.com/file/d/1RL7sf0vvfE7UDSQUH7atHHkibAUjprtn/view) ，共有24张图像，只选取了前22张低光照图像，未计入2张测试图像。

### images
- 用华为P40相机拍摄的15张低光照图像。

### IQA
非参考图像质量评价指标（[CEIQ](https://github.com/imfing/CEIQ)，[ENIQA](https://github.com/jacob6/ENIQA)）的项目文件，点击即可查看该指标Github项目源。指标（BRISQUE，NIQE，PIQE）MATLAB图像处理工具箱自带，直接调用即可。

- [BRISQUE](https://ww2.mathworks.cn/help/images/ref/brisque.html)：基于自然场景统计的失真通用非参考图像质量评估模型。
- [CEIQ](https://github.com/imfing/CEIQ)：基于对比度增强的失真图像非参考质量评价指标。
- [ENIQA](https://github.com/jacob6/ENIQA)：基于图像熵的高性能通用非参考图像质量评估指标。
- [NIQE](https://ww2.mathworks.cn/help/images/ref/niqe.html)：从自然场景图像计算的默认模型进行比较的非参考图像质量评估模型。
- [PIQE](https://ww2.mathworks.cn/help/images/ref/piqe.html)：基于感知的非参考图像质量评估器。

### ours
本项目 `.m` 函数文件夹

### Test
低光照图像增强领域各方法对比，具体说明见文件夹下`README.md`文件。
- `Dong.m`：Dong等人基于去雾模型的方法，论文[《Fast efficient algorithm for enhancement of low lighting video》](https://ieeexplore.ieee.org/document/6012107)
- `lime.m`：Guo等人基于Retinex模型的方法，论文[《LIME: Low-light Image Enhancement via Illumination Map Estimation》](https://ieeexplore.ieee.org/document/7782813)
- `multi_fusion.p`：Fu等人基于融合的方法，未开源，论文[《A fusion based Enhancing Method for Weakly illuminated Images》](https://xueyangfu.github.io/projects/sp2016.html)
- `ying.m`：论文[《A New Low-Light Image Enhancement Algorithm Using Camera Response Model》](https://ieeexplore.ieee.org/document/8265567)

***

## 实验结果
- **各方法主观对比**
![](https://cdn.jsdelivr.net/gh/TwoTu/MF-LIME@master/images/result.jpg)

- **各方法客观评价**
![](https://cdn.jsdelivr.net/gh/TwoTu/MF-LIME@master/images/result_datasets.jpg)


## Citations

```
@inproceedings{8305027, 
  author={W. Zhang and G. Li and Z. Ying}, 
  booktitle={2017 IEEE Visual Communications and Image Processing (VCIP)}, 
  title={A new underwater image enhancing method via color correction and illumination adjustment}, 
  year={2017},  
  pages={1-4}, 
  doi={10.1109/VCIP.2017.8305027},
}
@inproceedings{
  title={Color Balance and Fusion for Underwater Image Enhancement},
  author={C. O. Ancuti, C. Ancuti, C. De Vleeschouwer and P. Bekaert},
  booktitle={in IEEE Transactions on ImageProcessing,
  volume={27},
  pages={379-393},
  month = {Jan},
  year={2018}
}

@InProceedings{Ying_2017_ICCV,
  author = {Ying, Zhenqiang and Li, Ge and Ren, Yurui and Wang, Ronggang and Wang, Wenmin},
  title = {A New Low-Light Image Enhancement Algorithm Using Camera Response Model},
  booktitle = {The IEEE International Conference on Computer Vision (ICCV)},
  month = {Oct},
  year = {2017}
}
@article{fu2016mf,
  title={A fusion-based enhancing method for weakly illuminated images},
  author={Fu, Xueyang and Zeng, Delu and Huang, Yue and Liao, Yinghao and Ding, Xinghao and Paisley, John},
  journal={Signal Processing},
  volume={129},
  pages={82--96},
  year={2016},
  publisher={Elsevier}
}
@inproceedings{
  title={LIME: Low-light Image Enhancement via Illumination Map Estimation},
  author={Guo X , Yu L , Ling H},
  booktitle={IEEE Transactions on Image Processing},
  pages={1-1},
  year={2016},
  organization={IEEE}
}
@inproceedings{dong2011fast,
  title={Fast efficient algorithm for enhancement of low lighting video},
  author={Dong, Xuan and Wang, Guan and Pang, Yi and Li, Weixin and Wen, Jiangtao and Meng, Wei and Lu, Yao},
  booktitle={2011 IEEE International Conference on Multimedia and Expo},
  pages={1--6},
  year={2011},
  organization={IEEE}
}
```