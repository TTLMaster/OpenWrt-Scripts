# Способы перезапуска модема
По умолчанию в скрипте используется метод ребута роутера, но есть и другие методы. Ну что, поехали?

## Способ 1 - перезагрузка через API
У HiLink есть API. Через него можно делать с модемом все что угодно - перезагружать, реконнектить и т.д. Подробности в /sbin/yotareboot.

## Способ 2 - перезагрузка через telnet
У модифицированных прошивок есть telnet, через него можно перезагрузить модем. 

Если nc полноценный:

	echo reboot | nc -w 1 -i 1 192.168.8.1 23

Если нет:

	(echo reboot; sleep 1) | nc 192.168.8.1 23 & (sleep 1; kill `pidof $(ps | grep 'nc 192.168.8.1 23' | grep -v 'grep')`)

## Способ 3 - перезагрузка через adb
У adb есть два способа перезагрузки:

 1. `adb reboot`
 2. `adb shell reboot`

## Способ 4 - AT-команды
Вот оно! Единственный нормальный способ!
И так, нам понадобится лишь gcom, модифицированная прошивка для вашего модема (необязательно, зависит от модели) и скрипт в этом репозитории.
Ну что ж, поехали!
 
Сначала пропишем открытие порта PC UI. Для этого любым удобным способом открываем порты и вводим в порт PC UI вашим любимым терминалом:

`AT^NVWREX=50091,0,60,01 00 00 00 A1 A2 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 A3 A2 12 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00`

А теперь самое интересное - команды для перезапуска модема с роутера.

 1. `COMMAND=AT^RESET gcom -d $device -s /etc/gcom/runcommand.gcom`
 2. `COMMAND=AT+CFUN=1,1 gcom -d $device -s /etc/gcom/runcommand.gcom`
 
Выбирайте любую понравившуюся. Первая комнада чисто хуавеевская. Где $device - путь до командного порта. Скорее всего это будет /dev/ttyUSB0. В стике всегда несколько портов, обычно это самый старший. У меня это /dev/ttyUSB2.

И да, для вас наверняка осталось не понятным, когда нужна модифицированная прошивка. Очень просто! Она нужна тогда, когда на вашей прошивке заблокированно выполнение кодман ^NVWREX и ^NVRDEX. Узнать об этом можно в теме своего модема на 4PDA.

## Способ 5 - usbreset
`usbreset "Имя устройства"`

## Способ 6 - реконнект средствами OpenWrt
Подходит только для стика, увы

`/etc/init.d/network restart`

## Способ 7 - установка скрипта перезапуска прямо в модема
Пожалуй, идеальный вариант для HiLink!

Все, что нужно, вы найдете в архиве yotahilink.zip

Там есть скрипты для установки как под Windows, так и под Linux.

# Фикс TTL
Здесь приложена служба для фиксации TTL.
 
