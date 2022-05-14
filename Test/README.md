- `Dong.m`：Dong等人基于去雾模型的方法，论文[《Fast efficient algorithm for enhancement of low lighting video》](https://ieeexplore.ieee.org/document/6012107)
- `lime.m`：Guo等人基于Retinex模型的方法，论文[《LIME: Low-light Image Enhancement via Illumination Map Estimation》](https://ieeexplore.ieee.org/document/7782813)
- `LIME.p`：Guo等人LIME方法的核心，未开源。
- `multi_fusion.p`：Fu等人基于融合的方法，未开源，论文[《A fusion based Enhancing Method for Weakly illuminated Images》](https://xueyangfu.github.io/projects/sp2016.html)
- `ying.m`：论文[《A New Low-Light Image Enhancement Algorithm Using Camera Response Model》](https://ieeexplore.ieee.org/document/8265567)

- `our.m`：本项目的方法
- `test.m`：各方法主观对比，并计算五个非参考图像质量评价指标。
- `IQA_Data.m`：各方法图像质量评价指标，计算数据集平均值并写入到txt文件中。