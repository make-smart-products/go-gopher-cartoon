# Гофер Гоша: мультфильм про Go

Интерактивный учебный мультфильм для знакомства с основами Go.

## Файлы

- `cartoon/go-gopher-basics.html` — короткая вводная серия.
- `cartoon/go-gopher-series.html` — три серии по 5 минут с озвучкой и фоновой музыкой.
- `index.html` — стартовая страница для GitHub Pages.

## Как смотреть локально

Откройте в браузере:

```text
cartoon/go-gopher-series.html
```

Нажмите **«Старт со звуком»**. Озвучка запускается после клика, потому что браузеры блокируют автоматическое воспроизведение без действия пользователя.

Для записи серий можно использовать автостарт:

```text
cartoon/go-gopher-series.html?episode=1&autoplay=1
cartoon/go-gopher-series.html?episode=2&autoplay=1
cartoon/go-gopher-series.html?episode=3&autoplay=1
```

## GitHub Pages

После деплоя мультфильм доступен по адресу:

```text
https://make-smart-products.github.io/go-gopher-cartoon/
```

Публикация выполняется workflow `.github/workflows/deploy-cartoon-pages.yaml` после push в `main`.
