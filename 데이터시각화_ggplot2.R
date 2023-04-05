library(ggplot2)
iris = iris
# 데이터 구조
str(iris)

# 시각화
ggplot(data = iris,
       aes(x = Sepal.Length,
           y = Petal.Width)) +
  geom_point() +
  # 옵션
  theme_bw() +
  xlim(0, 20) +
  ylim(0, 5)

# mpg 데이터 가져오기
data()
mpg = mpg
str(mpg)

ggplot(mpg, aes(x = displ, y = cty)) +
  geom_point(shape = 20, size =3)+
  theme_bw()

table(mpg$cyl)

# Facets
# 그래프를 세부적으로 분리
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point(size = 3) +
  facet_wrap(~ manufacturer, nrow = 5) +
  theme_bw()

table(mpg$manufacturer)

ggplot(data = mpg) +
  geom_smooth(aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_boxplot(aes(x = class, y = hwy))








