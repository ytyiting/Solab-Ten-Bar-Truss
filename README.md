# Solab-Ten-Bar-Truss

作者：劉怡葶
## 程式撰寫目的
於本項程式內容主要是針對十桿衍架(ten-bar-truss)來做撰寫，計畫可將十桿衍架於受力情況下，求得各桿件位移、應力和反作用力\
可簡化桿件受力時之繁雜的計算

## 使用之程式
MATLAB具有豐富的函式庫，MATLAB Optimization Toolbox中之fmincon函式是最常被用來解決多變數非線性最佳化問題的函數其中之一，故於本次的作業使用MATLAB撰寫程式並加入fmincon來求解

## 此程式如何使用
下載homework檔案夾，並於MATLAB中開啟此檔案夾\
將每個.m檔都開啟之後，執行main.m檔，從workspace中可以獲得目標函數最佳值favl以及最佳解x

## 題目更動後可以如何更改程式
欲更動\
* 線性不等式條件：從main.m檔做更改
* 目標函數：從obj.m檔做更改
* 拘束條件：從nonlcon.m檔做更改
