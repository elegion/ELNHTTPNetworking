###Описание

Базовый сетевой слой для работы через HTTP на основе AFNetworking/Mantle/OHHTTPStubs. ELNHTTPClient оборачивает AFHTTPSessionManager и позволяет его настраивать и работать с NSURLSessionDataTask. ELNHTTPStubManager позволяет добавлять заглушки сетевых методов.

###Подключение

Через CocoaPods:

```
source 'https://github.com/elegion/ios-podspecs.git'
source 'https://github.com/CocoaPods/Specs.git'

pod 'ELNHTTPNetworking'
```

###Использование

Для использования всего и сразу есть общий хедер ELNHTTPNetworking.h.

#####Для настройки под конкретный проект:  
1. Создать класс конфигурации клиента, который реализует ELNHTTPClientConfiguration.  
2. При необходимости наследоваться от ELNHTTPClient и реализовать в подклассе протокол ELNHTTPClient.  
  
При необходимости передавать дополнительные параметры инициализации в клиент их нужно добавлять в класс конфигурации.  
  
#####Для создания запроса:  
1. Добавить класс, удовлетворяющий протокол ELNHTTPRequest.  
2. При необходимости добавить класс ответа, удовлетворяющий протокол MTLJSONSerializing.  
  
#####Реализация заглушек  
С помощью ELNHTTPStubManager можно добавлять заглушки для запросов.  
  
Есть реализация протокола по умолчанию: ELNDefaultHTTPStubManager. В данной реализации класс заглушки находится по имени запроса с добавлением "Stub" в конце (ELNAnyRequest -> ELNAnyRequestStub). Реализацией по умолчанию поддерживаются типы заглушек: NSString, id<MTLJSONSerializing>, NSError, OHHTTPStubsResponse, NSArray<MTLModel *>.  
  
Для определения состояния приложения может потребоваться использовать контексты. Чтобы определить, какую заглушку возвращать, можно определять состояние приложения с помощью контекстов. Для этого нужно передать необходимые данные в stub manager и реализовать метод -contextForRequest:.
