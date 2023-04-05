library(dplyr)
install.packages('tidyverse')

result = 1 / 20 * 30
result2 <- 1 / 20 * 30

# vector 만들기
# vector : 같은 종류의 데이터 

char_vector <- c("A", "B", "C")
class(char_vector)

char_vector

city <- c("서울", "부산", "서울", "부산")
class(city)

city <- factor(c("서울", "부산", "서울", "부산"))
class(city)
city

# dplyr SQL 문법과 유사한게 많음
#install.packages("nycflights13")


library(nycflights13)
library(dplyr)

flights = nycflights13::flights

glimpse(flights)


# SELECT
# python flights.gruopby
#SELECT FROM WHERE
flights %>%
  select(year, month, day, carrier, distance) %>%
  filter(distance >= 1400 & carrier %in% c("UA", "AA", "B6")) %>%
  group_by(carrier) %>%
  summarise(avg_distance = mean(distance)) %>%
  arrange(desc(avg_distance)) %>%
  filter(avg_distance >= 2100)

# 결측치 다루기
NA > 10 # NA --> 난 모름

NA == 5 # NA --> 난 모름

NA + 100 # NA

NA * 100 # NA

NA == NA  # NA         

a = NA
is.na(a)

temp <- tibble(x = c(1, 2, NA, 4))
temp

# filter
temp %>% filter(x > 1)

# filter, 반드시 NA도 같이 출력이 되어야 함
temp %>% filter(x > 1 | is.na(x))
temp %>% filter(is.na(x))

# SELECT문 다시보기
glimpse(flights)
flights %>%
  select(year : dep_delay)
  # select(-(year : dep_delay))

glimpse(flights)

flights %>%
  select(contains("time"))

# mutate() : 컬럼의 상태를 변경하는 메소드
data <- flights %>%
  select(year:day, ends_with("_time"), distance)
data

glimpse(data)

data %>%
  mutate(time_diff = arr_time - dep_time) %>%
  select(dep_time, arr_time, time_diff)

# 윈도우 함수
# rank(), dense_rank(), row_number()
temp_num <- c(1, 2, 2, 3, NA, 32, 4, 5)
row_number(temp_num)
dense_rank(temp_num)
percent_rank(temp_num)

# dplyr + ggplot2 한꺼번에 작성하기
library(ggplot2)

flights %>%
  group_by(dest) %>%
  summarise(count = n(),
            dist = mean(distance, na.rm = TRUE),
            delay = mean(arr_delay, na.rm = TRUE)) %>%
  filter(count > 20 & dest !="ACK") %>%
  ggplot(aes(x = dist, y = delay)) +
  geom_point() +
  theme_bw()

# 파일 입출력
# csv 파일 불러오기
mpg = read.csv(file = "data/mpg6.csv")
write.csv(mpg,file = "data/result.csv")


# install.packages("writexl")
library(writexl)
write_xlsx(mpg, "data/result.xlsx")

# 엑셀 파일 불러오기
install.packages("readxl")
library(readxl)
mpg2 = read_excel(path = 'data/result.xlsx')
mpg2
mpg
