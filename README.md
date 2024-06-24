# THNGP Jetton GPU Miner

RU Сообщество Things Token  - https://t.me/things_token  
EN Сообщество Things Token - https://t.me/things_global  
Сообщество из [оригинального репозитория](https://github.com/TrueCarry/JettonGramGpuMiner) TrueCarry - https://t.me/blckbazars

Майнер для жетона THNGP. Нужна Windows/Linux и видеокарта с драйверами CUDA или OpenCL

1. Создайте `config.txt` в формате
  ```
  SEED=word1 word2
  TONAPI_TOKEN=
  TARGET_ADDRESS=
  ```
  где:
  - SEED - сид-фраза кошелька
  - TONAPI_TOKEN - токен с сайта [tonapi](https://tonapi.io) (можно оставить пустым и использовать "--api tonhub" или "--api lite")
  - TARGET_ADDRESS - адрес кошелька, куда будут приходить токены

2. Активируйте v4r2 кошелек. Отправьте на него средства, а потом отправьте транзакцию самому себе.
3. Установите NodeJs [https://nodejs.org](https://nodejs.org/en)
4. Запустите майнер с помощью `start_things.sh` (Linux) или `start_things.bat` (Windows)

## Скрипт быстрого запуска для Linux:
Данный скрипт делает полную настройку майнера для Linux. Вам необходимо только заменить **SEED**, **TONAPI_TOKEN**, и **TARGET_ADDRESS**. Также при необходимости измените параметры **--givers** и **--gpu-count**.
```
# Устанавливаем необходимые пакеты
apt update -y && apt install -y screen git curl cron nano

# Добавляем репозиторий и обновляем libc6
echo "deb http://cz.archive.ubuntu.com/ubuntu jammy main" >> /etc/apt/sources.list && apt update && apt install -y libc6

# Устанавливаем nvm и обновляем node.js до версии 18
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm" 
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install 18 
nvm use 18 
nvm alias default 18

# Создаем директорию для майнера и переходим в нее
cd /home/user
mkdir -p THINGS
cd THINGS

# Клонируем репозиторий с майнером
git clone https://github.com/Titrom025/JettonTHNGPGpuMiner

# Переходим в директорию с майнером
cd JettonTHNGPGpuMiner

# Создаем файл конфигурации config.txt
cat <<EOL > config.txt
SEED="word1 word2"
TONAPI_TOKEN="Enter you token"
TARGET_ADDRESS="Enter your adress"
EOL

# Создаем файл для запуска start_multi_gpu_things.sh
cat <<EOL > start_multi_gpu_things.sh
#!/bin/bash
npm install
while true; do
  node send_multigpu_things.js --api tonapi --bin ./pow-miner-cuda --givers 200 --gpu-count 1
  sleep 1;
done;
EOL

# Предоставляем права на выполнение скрипта
chmod +x start_multi_gpu_things.sh

# Запускаем скрипт в screen сессии
screen -dmS mining bash -c './start_multi_gpu_things.sh'

# Инструкция для просмотра screen сессии
echo "Для просмотра майнинга выполните: screen -r mining"
```

## Скрипты запуска things:
```
start_multi_8_things.bat - Windows, tonapi, 8 GPU, 10 000 givers
start_multi_8_things.sh - Linux, tonapi, 8 GPU, 10 000 givers
start_things_tonhub.bat - Windows, tonhub, 10 000 givers
start_things.bat - Windows, tonapi, 10 000 givers
start_things.sh - Linux, tonapi, 10 000 givers
```

## Файлы связанные с майнингом things:
```
givers_things.js
givers_things.ts
send_multigpu_things.js
send_multigpu_things.ts
send_universal_things.js
send_universal_things.ts
```

## TonApi

Так же вы можете использовать TonApi(tonconsole.com) как провайдер апи. Он дает повышенную стабильность, но не работает без ключа. На 1 майнера достаточно бесплатного токена. Для запуска майнера с tonapi используйте `start_tonapi_X.bat` или `start_tonapi_X.sh`(с суффиксом \_amd для компьютеров без CUDA)

## Multi GPU

Можно запустить несколько видеокарт одним скриптом. Пример в файле `start_multi_8.sh`, `start_multi_8.bat`.
Чтобы превратить любой стартовый скрипт в мульти, надо заменить `send_universal` на `send_multigpu`
`--gpu 0` заменить на `--gpu-count X`, где Х кол-во ваших GPU
Больше ничего менять не нужно, можно запускать

# EN

Community:
- Things Token [RU - https://t.me/things_token](https://t.me/things_token)
- Things Token [EN - https://t.me/things_global](https://t.me/things_global)
- Original repository community by TrueCarry - [https://t.me/blckbazars](https://t.me/blckbazars)

Miner for THNGP jetton. Windows/Linux and a CUDA or OpenCL GPU are required.

1. Create `config.txt` in the format:
   ```
   SEED=word1 word2
   TONAPI_TOKEN=
   TARGET_ADDRESS=
   ```
   where:
   - SEED - wallet mnemonic phrase
   - TONAPI_TOKEN - token from [tonapi](https://tonapi.io) (can be left empty and use "--api tonhub" or "--api lite")
   - TARGET_ADDRESS - wallet address where tokens will be sent

2. Activate the v4r2 wallet. Send some funds to it, then send a transaction to yourself.
3. Install NodeJs [https://nodejs.org](https://nodejs.org/en).
4. Start the miner by running `start_things.sh` (Linux) or `start_things.bat` (Windows).

# 中文

社群：
- Things Token [RU - https://t.me/things_token](https://t.me/things_token)
- Things Token [EN - https://t.me/things_global](https://t.me/things_global)
- 原始存儲庫社群 TrueCarry - [https://t.me/blckbazars](https://t.me/blckbazars)

目前挖礦 THNGP 以及其他近似的 Jetton 代幣，僅支持 CUDA 或 OpenCL 的顯卡。

1. 創建 `config.txt` 文件，格式如下：
   ```
   SEED=word1 word2
   TONAPI_TOKEN=
   TARGET_ADDRESS=
   ```
   其中：
   - SEED - 錢包助記詞
   - TONAPI_TOKEN - 來自 [tonapi](https://tonapi.io) 的令牌（可以留空，並使用 "--api tonhub" 或 "--api lite"）
   - TARGET_ADDRESS - 接收代幣的錢包地址

2. 啟用 v4r2 錢包，並將一些資金發送到錢包中，然後向自己發送一筆交易。
3. 安裝 NodeJs [https://nodejs.org](https://nodejs.org/en)。
4. 通過運行 `start_things.sh`（Linux）或 `start_things.bat`（Windows）啟動挖礦。