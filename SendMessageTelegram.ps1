#Отправка запросов
#Все запросы к Telegram Bot API должны осуществляться через HTTPS в следующем виде:
#https://api.telegram.org/bot<token>/НАЗВАНИЕ_МЕТОДА.


$token = ""
$chat_id = ""
$text = ""

$URI = "https://api.telegram.org/bot" + $token + "/sendMessage?chat_id=" + $chat_id + "&text=" + $text
$Request = Invoke-WebRequest -URI ($URI) 