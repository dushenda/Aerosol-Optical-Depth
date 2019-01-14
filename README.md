# 大气光学厚度
​	计算了太阳天顶角和大气质量，再对其进行计算，分析误差。

## 1.计算太阳天顶角

### 五种算法误差报告

​	本文主要探讨了几种计算天顶角的算法，并且根据已经测得的标准数据进行了误差对比，以此来判断几种算法的精度。

### 黄冬师兄采用算法的误差

##### 算法的计算步骤

​	算法的详情我不是很了解，但是我得到了计算后的数据，将其与标准数据做对比。

​	主要运用了五种计算方法计算了太阳天顶角。根据实际的测量数据，测试每种算法的误差。

对于五种算法的误差进行了比较，然后得到较优的算法，采取它进行计算，得到的称为算法 0。如图 1.1 所示。

##### 算法的最终结果

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/huang.bmp)

​										图 1.1  算法0的误差

### 五种算法的公共部分

#### 前处理部分

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/Δτ.png)

Δτ的计算是根据上图用插值法计算的一个线性表达式
$$
\Delta\tau=96.4+0.00158t\\
t=\Delta day=(year_{now}-2060)\times365.2425
$$
参数解释:

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/Al5table.png)

根据实际情况，确定了一些参数

| 参数名称 | 参数符号 | 单位 |      参数值       |
| :------: | :------: | :--: | :---------------: |
|   经度   |    θ     | rad  | 1.647765346807846 |
|   纬度   |    φ     | rad  | 0.699702497124527 |
|   压强   |    P     | atm  |    0.85862324     |
|   温度   |    T     |  ℃   |        25         |

在计算过程中，如果月份 m<2，那么把月份加 12，年份减 1，这里的 INT 是表示向 0 取整。前处理过程如下：

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/PreProcess.png)
$$
\omega=0.017202786day^{-1}
$$

#### 后角度计算部分

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/Finalstep (1).png)

![Finalstep (2)](https://github.com/dushenda/OpticalDepth/raw/master/img/Finalstep (2).png)

![Finalstep (3)](https://github.com/dushenda/OpticalDepth/raw/master/img/Finalstep (3).png)

![Finalstep (4)](https://github.com/dushenda/OpticalDepth/raw/master/img/Finalstep (4).png)

![Finalstep (5)](https://github.com/dushenda/OpticalDepth/raw/master/img/Finalstep (5).png)

![Finalstep (6)](https://github.com/dushenda/OpticalDepth/raw/master/img/Finalstep (6).png)

计算时只需要知道 <u>纬度、赤经、赤纬、时角</u> 即可。

### 第一种算法

#### 算法的计算步骤

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/Al1.png)

#### 算法的结果

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/第一种算法.bmp)

​										图 1.2  算法1的误差

​	根据文献的第一种算法计算的误差不容乐观，在**<u>-0.2~0.3</u>**之间，参考黄冬师兄算的误差，这个扩大了30倍。说明这个算法的精度不是很高，在文献中，这个算法最后也使用了计算数据进行了比较，他给出天顶角的误差范围在**<u>-0.19~0.19</u>**，实际计算的比这个范围稍大些，只能说是我们这个数据不够精确或者文献的数据凑得比较好。

### 第二种算法

#### 算法的步骤

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/Al2.png)

#### 算法的结果

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/第二种算法.bmp)

​										图 1.3  算法2的误差

​	其实最大的不同只是reportFun()函数是不一样的，因为这个是算法的核心，主函数也是类似的，写入数据，调用函数，得到输出，最后画一下误差图。

​	其他的前处理函数，后处理函数都是一模一样的。

### 第三种算法

#### 算法的步骤

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/Al3.png)

#### 算法的结果

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/第三种算法.bmp)

​										图 1.4  算法3的误差

​	从图上看出来，这个集散的误差范围在**<u>-0.17~0.17</u>**之间。对比文献，他给出天顶角的误差范围在**<u>-0.0093~0.0093</u>**，实际计算的比这个范围大了18倍，说明这个差距还是很大的，是有一定问题的。

### 第四种算法

#### 算法步骤

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/Al4(1).png)

![Al4(2)](https://github.com/dushenda/OpticalDepth/raw/master/img/Al4(2).png)

#### 算法结果

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/第四种算法.bmp)

​										图 1.5  算法4的误差

​	算法计算的误差在**<u>-0.17~0.17</u>**之间。与算法三计算的差不多，文献中写的误差范围是**<u>-0.0091~0.0091</u>**，差了17.5倍左右。

### 第五种算法

#### 算法步骤

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/Al5(2).png)

![Al5](https://github.com/dushenda/OpticalDepth/raw/master/img/Al5.png)

参数如下：

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/Al5table.png)

#### 算法结果

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/第五种算法.bmp)

​										图 1.6  算法5的误差

​	图上看误差大概也是**<u>-0.17~0.16</u>**，文献的误差范围给的是**<u>-0.0025~0.0027</u>**，差距是64倍左右，这个差距是很大的。

#### 分析一下8月7日

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/算法5_8月7日角度值.bmp)

​										图 1.7  计算的天顶角

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/算法5_8月7日误差散点.bmp)

​										图 1.8  天顶角计算误差

​	看了上面两张图，第一张其实看不出来什么，因为误差相对于测量角度的实际值差了100倍左右，能看出来的只是说一天中太阳天顶角是这么分布的。

​	第二张图和第一张图结合看其实是能看出来一点东西的，看到其实到了6点左右也是天顶角最小，这也是说明这时候高度角最大，太阳在比较高的地方，这时候计算的误差是小的，在00：00和12：00处误差也较大。

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/算法5_8月7日分布图.bmp)

​										图 1.9  天顶角误差分布

​	看了上面的三幅图，看到这些计算的结果，可以发现误差的分布也有点稀奇古怪，看不出来是什么类型的分布，因为我觉得数据的总数也不是很大，来计算的点数也不够多。可能这样子反应的规律也不是跟明确。总体上来看，还是误差小的占的比例大，所以可能这也是可以稍微有点欣慰的一件事吧。

### 总结

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/算法1~算法4.bmp)

​											图 1.10  计算汇总 1

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/算法0和算法5.bmp)

​											图 1.11  计算汇总2

### 说明

| 算法 | 文献给的误差范围 | 计算的误差范围 | 相差倍数 |
| :--: | :--------------: | :------------: | :------: |
|  1   |   [-0.19,0.19]   |   [-0.2,0.3]   | 1.05~1.5 |
|  2   |  [-0,034,0.034]  |   [-0.2,0.2]   |   5.8    |
|  3   | [-0.0093,0.0092] |  [-0.17,0.17]  |   18.3   |
|  4   | [-0.0091,0.0093] |  [-0.17,0.17]  |   18.7   |
|  5   | [-0.0025,0.0027] |  [-0.16,0.16]  |   59.3   |

从这个表格中看出，几种计算出来的结果都在只能最高保证在0.16。

### 参考文献

[1]  Roberto Grena  Five new algorithms for the computation of sun position from 2010 to 2110 Solar Energy

https://www.sciencedirect.com/science/article/pii/S0038092X12000400

## 2.计算大气质量

### 简介

​	整理的文献为 *Revised optical air mass tables and approximation formula* 。

​	文章一开始介绍了一个由Karsten在1965年发表的并且广泛被世界所采用的关于大气质量的近似公式，并且讨论了一些由于各个学科对于不同的物理量符号和术语的不同使得读者经常由此而困惑。

​	其后介绍了一个计算大气光学质量的近似公式，然后说明了在公式中存在的一种不定情况，之后又对这个近似公式用非线性最小二乘法进行修正得到了一组新的系数。后面又根据索引文献[1]文中也多次提到这篇文献，很多都是从这篇文献里面来的。

​	还有从一篇 《基于遥感与地面监测数据的城市气溶胶定量反演研究”》，作者是王耀庭，南京师范大学博士论文。

### 一个通用的公式引入

$$
m(\gamma)=\frac{m_{abs}(\gamma)}{m_{abs}(90^{\circ})}\\
m_{abs}(\gamma)=\rho_{0}\int^{\infty}_{0} \frac{\rho}{\rho_{0}}([1-[1+2\delta_{0}(1-\frac{\rho}{\rho_{0}})]]\times
	[\frac{\cos \gamma}{1+\frac{h}{R}}]^{2})^{-\frac{1}{2}}dh\\
	h是相对于海平面的平均高度；\\
	\rho=\rho(h)，是在高度h处的大气质量；
$$

​										表 1  已知参数

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/表格1.png)

​	根据以上的式子 (1),(2) 和已知的参数表1。要计算这个定积分，那就还需要知道 ρ, 也就是 ρ(h) 在高度 h 处的大气密度，但是我在文献中找不到，这是个问题，不知道是不是需要再去别的地方找这个 ρ，看完了这篇文章之后，知道了这个 ρ 还是没有找到，但是文章已经给出了计算得到的结果的表格。

### 近似计算公式和不同的系数

$$
f(\gamma)=[\sin \gamma+a(\gamma+b)^{-c}]^{-1}\\
\gamma是高度角，单位是^\circ;\\
f(\gamma)是用近似公式计算的m(\gamma);\\
a,b,c是式子的常数，a=0.1500，b=3.885^{\circ}，c=1.253;
$$

a,b,c这三个常数决定于最小二乘法的相对误差，也就是用前面的计算公式计算数据之后，用最小二乘法进行拟合，使用(3)的形式来计算三个常数。

​	文献后面又介绍了两个不同的参数组合，一个是根据非线性最小二乘法计算的 a=0.50572,b=6.07995°, c=1.6364；一个是根据 Bemporad 的经典大气质量表确定的，a=0.6556,b=6.379°,c=1.757[1]，其中文献的表中的r(γ)是根据公式(4)计算的相对误差，用来衡量计算大气质量的相对误差。
$$
r(\gamma)=\frac{f(\gamma)-m(\gamma)}{m(\gamma)}
$$

### 积分问题和解决

​	对于公式(2)，积分会在γ=0和h接近于0的地方不定，在这种情况下，这个积分可以通过执行一个特殊的程序来进行计算，在参考文献[1]中有写这个程序。但是在计算的时候有个错误会混入，在地平线上的值36.2648会比实际的小5%左右。

​	举例而言，在 Link 和 Neuzil[3] 文章的表中所给出的地平线上的在1962年美国的标准大气的大气质量是38.16，这跟 1959 年 Karsen 用的 ARDC 模型十分接近。Snider 和 Goldman[4] 给出的关于 1962 年的模型的38.10也是高度相似。Treve[5] 使用1959年的 ARDC 模型，得到了在地平线上的相对大气质量分别是 0.55μm 的38.11和在0.70μm的38.08。

​	还有就是采用一种新的标准来却确定式子 (2) 中的参数会优于旧的模型，也就是最新的国际标准化组织的大气模型 (ISO Standrad Atmophere) 代替 ARDC 模型大气(由国际民航组织 ICAO 提出的)，这个仅有的变化也就是名义地球半径变为R=6.356766×10^6m。

### 一个计算公式

$$
m=\frac{1}{cos \frac{\pi \theta_0}{180^\circ}+0.15\times(93.885-\theta_0)^{-1.253}}
$$

​	其中m是需要计算的大气质量，θ`0`是天顶角。

### 我要做的工作

​	在这篇文章里面，我要做的就是编写一个程序，根据文献中的大气质量近似公式(3)，并且用不同的参数组带入，将表格中自变量太阳高度角γ作为自变量带入近似公式计算，再与表格中所给的大气质量数进行作差比较，即验证这个算法是否真的符合实际，如果误差较小，则可以用到我们的项目中去。

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/表格2.png)

​	上面的这张表格也就说明了在文章计算的数据中天顶角γ的取值变化，也就是计算的时候自变量所采用的值。过计算得到了一些结果。

### 结果

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/几种方法计算的大气质量.bmp)

​							      图 2.1  标准大气质量和用其他公式计算的大气质量

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/几种方法计算的大气质量.bmp)

​									图 2.2  四种计算方法与标准大气质量

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/三种计算方法计算的值.bmp)

​									图 2.3  三种拟合系数计算的大气质量

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/几种方法计算的大气质量的误差值.bmp)

​											图 2.4  误差曲线

### 分析

​	从上面的图中可以看到，用三种不同的系数计算的相对大气质量以及三组拟合系数的误差曲线，从图中可以看到，三者在天顶角大于 30° 之后都是差不多的经度，主要就是在30°之前的差异。而且可以看到在起始点的时候，第一组和第三组都有很大的误差，特别是第三组，误差都接近于4%，回想文章中提到的积分会在 γ=0 和 h 接近于 0 的地方不定，需要查阅参考文献[1]来寻找解决方法。但是我看到这个计算的第二组拟合系数表现的很好，不知道是否可以用第二组数据来计算，或者是这三组数据都是在不同的情况下表现的经度水平会不一样。但是有个问题，我们没有找到拟合系数1的这条曲线，在下面会进行说明，实际上<u>它是和其他公式计算的这条曲线重合了</u>。

​	对比三种方法和一个计算公式，发现计算公式的误差在几个计算方法折中的位置，在角度 >10° 之后，这个计算值的偏差与第二组拟合系数计算的误差一样，都是非常小的。

​	可以看看在高度角大于10°时候的表现。

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/高度角大于10°的大气质量误差.bmp)

​							图 2.5  在高度角大于10°时候计算大气质量的误差

​	这里没有找到拟合系数1这条曲线，是因为他的变化与公式计算的是一模一样的，两条线是重合的。

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/找拟合系数1这条线.bmp)

​						图 2.6  拟合系数1和公式计算的天顶角大于10°的误差曲线



​       						

这说明，其实拟合系数1也就是将天顶角计算的公式做了稍微的变化，就得到了太阳高度角的，<u>本质上，这两个公式是一模一样的</u>，只是取得系数不同罢了。

### 新给的数据的计算

​	在之后使用已经写好的这几种计算方法来计算新的数据值，数据可以在 ‘1.xlsx’ 表格中找到。

![image](https://github.com/dushenda/OpticalDepth/raw/master/img/8月6号到8号计算的大气质量值.bmp)

​						图 2.7  根据所给的数据计算的三天的大气质量数值

​	可以看到，其实一天内的天顶角并不是全是 0~90° 的，这几天维持在 40° 以下，这时候，查阅标准数据也是差不多在这样的数据范围。

### 参考文献

[1] Kasten,"A New Table and Approximation Formula for the Relative Optical Air Mass",Arch.Meteorol.Geophys.Bioklimatol.Ser.B 14,206-223(1965).
[2] R.A Miner,K.S.W.Chamption,and H.L.Pond,The ARDC Model Atmosphere,1959,Air Force Surveys in Geophysics 11(AFCRL,1959)
[3] F.Link and L.Neuzil,Table of Light Trajectories in the Terrestrial Atmosphere(Hermann,Paris,1969)
[4] D.E Snier and A. Goldman,Refractive Effects in Remote Sensing of Atmosphere with Infrared Transmission Spectroscopy,(Ballistic Research Labratories,June 1975)
[5] Y. M. Treve, New Values of the Optical Air Mass and the
Refraction and Comparison with Previous Tables," in Proceed-ings, Second Tropospheric Refraction Effects Technical ReviewMeeting, Technical Documentary Rep. ESD-TDR 64-103, May1964 (National Technical Information Service Order AD-442626), pp.5-391.
[6] International Organization for Standardization,Standard Atmosphere,International Standard ISO253(1972)
[7] S.L.Valley,Handbook of Geophysics and Space Physics
(AFCRL,1965), pp.23.
[8] W.H.Jefferys,M.J.Fitzpatrick,B.E.McArthur,andJ.E.
McCartney, GaussFit:A System for Least Squares and RobustEstimation (U. Texas at Austin, 1989).
[9] A.T.Young,Observational Technique and Data Reduction," inle to Methods of Experimental Physics(Vol. 12, Astrophysics; Partrmly A:Optical and Infrared),N,Carleton,Ed.(Academic, New York, 1974),p.150.

## 3.拟合参数曲线

​	将其用公式进行拟合，得到大气光学厚度。
