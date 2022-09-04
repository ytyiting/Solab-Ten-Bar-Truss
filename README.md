# Solab-Ten-Bar-Truss


## 程式撰寫目的
於本項程式內容主要是針對簡化十桿衍架(ten-bar-truss)的繁雜計算來做撰寫，計畫可求得十桿衍架於受力情況時各桿件位移、應力和反作用力

## 使用之程式
MATLAB具有豐富的函式庫，其中MATLAB Optimization Toolbox中之fmincon函式為最常被用來解決多變數非線性最佳化問題的函數之一，故於本次的作業使用MATLAB撰寫程式並使用fmincon來求解十桿衍架的問題

## 此程式如何使用
1. 下載homework檔案夾，並於MATLAB中開啟此檔案夾\
2. 將每個.m檔都開啟之後，執行main.m檔，從workspace中可以獲得目標函數最佳值 favl 以及最佳解 x

## 若題目更動後可以如何更改程式
欲更動
* 線性不等式條件：從main.m檔做更改
* 目標函數：從obj.m檔做更改
* 拘束條件：從nonlcon.m檔做更改
