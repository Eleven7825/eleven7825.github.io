---
title:  "Gaussian filter - with Matlab example"
mathjax: true
author: Eleven Chen
category: AMLSH
---


Sample rate: 60 frames per second



```
load xy585.mat
```



On the vertical direction:



```
plot(t,x); xlabel('time(s)');ylabel('Displacement(cm)')
```


![figure0.png](./2021-07-11-Gaussian-filter_images/figure0.png)



On the horizontal direction:



```
plot(t,y); xlabel('time(s)');ylabel('Displacement(cm)')
```


![figure1.png](./2021-07-11-Gaussian-filter_images/figure1.png)



How does the data sound like?



```
soundsc(x,5000);
```



After fourier transformation:



```
fv = fftshift(fft(x));
semilogy(((1:length(fv))-length(fv)/2)/length(fv).*60,real(fv).^2)
xlabel('freqency(herz)');
```


![figure2.png](./2021-07-11-Gaussian-filter_images/figure2.png)

## Gassian filter

```
sigma = 5;
k = -30:.1:30;
plot(k,exp(-0.5*abs(k).^2/sigma^2));xlabel('freqency(herz)');
```


![figure3.png](./2021-07-11-Gaussian-filter_images/figure3.png)


```
clf
gaussianF(y,1e2); xlabel('time(s)');ylabel('position(cm)')
```


![figure4.png](./2021-07-11-Gaussian-filter_images/figure4.png)

## Invere gaussian filter

```
c = 5;
sigma = 1;
plot(k,(1-exp(-0.5*abs(k+c).^2/sigma^2)).*(1-exp(-0.5*abs(k-c).^2/sigma^2)))
ylim([0 1.2]);xlabel('freqency(herz)');
```


![figure5.png](./2021-07-11-Gaussian-filter_images/figure5.png)


```
clf
invergaussF(x,[0.357 5.5],1,0.1e3);
```


![figure6.png](./2021-07-11-Gaussian-filter_images/figure6.png)

## spectrogram

```matlab:Code
open("signalProcessing.mldatx")
```


