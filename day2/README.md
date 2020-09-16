# 그래프 그리기


## plot 을 이용한 2차원 그래프
* 그래프의 구성
    - title
    - x label
        - x 축 이름
    - y label
        - y 축 이름
    - legend
        - 그래프 구분

```matlab
>>> plot(x, y, option);
```

- x 
    - x 축 데이터 벡터
- y
    - y 축 데이터 벡터
    - x 축 데이터 벡터와 크기가 같아야 함
- option
    - 그래프의 형태에 대한 옵션

```matlab
clear ;
clc ;



t = linspace(0, 5, 100);
f = 1;
y = sin( 2*pi*f*t );

figure(1) % 여러 그래프를 따로 띄울때 필요한 인덱싱?

plot(t, y, '-or') ;
```

![1](./images/1.png)



## 여러 그래프 한 화면에 띄우기

```matlab

clear ;
clc ;

t = linspace(0, 2, 100);

f1 = 1;
f2 = 3;
f3 = 5;

y1 = cos( 2*pi*f1*t );
y2 = cos( 2*pi*f2*t );
y3 = cos( 2*pi*f3*t );
y4 = y1 + y2 + y3 ;

figure(1);

plot(t, y1, '-o', t, y2, '-x', t, y3, '-^', t, y4, '-d');

title('sinusoid');
xlabel('Time, t [sec]');
ylabel('Signal y(t)');
legend('1Hz', '3Hz', '5Hz', 'sum');

```

![2](./images/2.png)


```matlab

% holdon 이용해서 한 그래프에 계속 추가 하기

figure(1)
plot(t, y1);
hold on:
plot(t, y2);
plot(t, t3);

grid on: % 그래프 위에 안내선 그리기
title('test');
xlabel('foo');
ylabel('bar);

```
