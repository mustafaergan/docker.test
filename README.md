# Spring Boot Docker Denemesi

Bir Spring Boot uygulamasını JAR olarak paketleyip Docker imajı içinde çalıştırmayı denemek için yazılmış
en küçük örnek. Uygulama tek bir REST uç noktası sunar.

> **Not:** Bu depo 2024 yılında deneme amaçlı yazıldı ve artık güncellenmiyor. Bağımlılıklar zamanla eskiyip
> güvenlik açığı içerebilir; üretimde kullanmayın.

## İçerik

- `src/main/java/.../Application.java` — `GET /Hello` isteğine "Docker example" yanıtı veren uygulama.
- `Dockerfile` — `openjdk:17` imajı üzerine `target/docker.test-0.0.1-SNAPSHOT.jar` dosyasını ekleyip çalıştırır.
- `mvnw`, `mvnw.cmd` — Maven kurulu olmadan derlemek için Maven Wrapper (Maven 3.9.9).

## Teknolojiler

- Java 17, Spring Boot 3.3.4 (web)
- Maven Wrapper, Docker

## Çalıştırma

Önce JAR'ı üretin, sonra imajı derleyip çalıştırın:

```bash
./mvnw clean package
docker build -t docker-test .
docker run --rm -p 8080:8080 docker-test
curl http://localhost:8080/Hello
```

Docker olmadan denemek için `./mvnw spring-boot:run` yeterlidir.

`openjdk` resmi imajı artık güncellenmediğinden, yeniden kullanacaksanız `Dockerfile`'daki temel imajı
`eclipse-temurin:17-jre` gibi bakımı süren bir imajla değiştirmeniz önerilir.
