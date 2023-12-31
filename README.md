### GitHub Actions && Docker

## Приложение
Пустой проект на node.js `create-react-app`
## Workflow
- Триггер - push в ветку master
- Запускается на машине с ubuntu
- action загрузки docker и docker buildX
- action сборки приложения с использованием Dockerfile без push'a
- выставление данных в git config для интеграции с гитом
- action на уведомления в телеграмм, в секретах указаны токен бота и chat id куда приходят уведомления. В аргументах указаны текст уведомления - уникальный номер рабочего процесса.

![](https://github.com/Morody/React/blob/master/img/9.png?raw=true)
![](https://github.com/Morody/React/blob/master/img/8.png?raw=true)
## Dockerfile
Реализована `multi-stage` сборка

- Cкачиваем docker, собираем образ, запускаем контейнер `docker run -d {container id}`
- Запускается контейнер с образом `node.js`. Скачиваются зависимости и собирается приложение.
Появляется папка `build`, в которой находится минимизированная статическая версия приложения, готовая к деплою на сервере.
- Запускается второй контейнер с образом `node:18`. В рабочую директорию этого контейнера копируется содержимое папки `build` и
инсталлируется npm пакет, с помощью которого можно развернуть приложение.
